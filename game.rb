#all the different slots that you can play
@slots = { 
	"a1"=>" ","a2"=>" ","a3"=>" ",
	"b1"=>" ","b2"=>" ","b3"=>" ",
	"c1"=>" ","c2"=>" ","c3"=>" "
}

#all 8 winning matches
@winning = [ 
	['a1', 'a2', 'a3'],
	['b1', 'b2', 'b3'],
	['c1', 'c2', 'c3'],
	['a1', 'b1', 'c1'],
	['a2', 'b2', 'c2'],
	['a3', 'b3', 'c3'],
	['a1', 'b2', 'c3'],
	['c1', 'b2', 'a3']
]

# determine who is X or O
# use .5 because only 2 options [x or o]

@comp = rand() > 0.5 ? 'X' : 'O'
@player = @comp == 'X' ? 'O' : 'X'

# player names; introduction
@comp_name = "Computer"
puts "TIC TAC TOE"
puts "Player, what is your name?"
STDOUT.flush
@player_name = gets.chomp

#draw game method shows slots, empty and full
def draw_game
  puts "-----------------------------------------------------------------------------"

  puts "TIC TAC TOE"
  puts "#{@comp_name}: #{@comp}"
  puts "#{@player_name}: #{@player}"
  puts ""
  puts "   a   b   c"
  puts ""
  puts " 1 #{@slots["a1"]} | #{@slots["b1"]} | #{@slots["c1"]}"
  puts "   ---------"
  puts " 2 #{@slots["a2"]} | #{@slots["b2"]} | #{@slots["c2"]}"
  puts "   ---------"
  puts " 3 #{@slots["a3"]} | #{@slots["b3"]} | #{@slots["c3"]}"
  puts ""
end

def moves_left
  slots = 0
  @slots.each do |k, v|
    slots += 1 if v == " "
  end
  slots
 end

#checking winnings or loses or continuings
def check_game(next_turn)
  game_over = false
  #@winnings.each do |column|
  for column in [@winnings] do
    #comp has won?
    if times_in_column(column, @comp) == 3 #three in a row
	  puts ""
      puts "Game Over Dude, the Computer won!!!"
      game_over = true
    end
	
    #player has won?
    if times_in_column(column, @player) == 3 #three in a row
	  puts ""
      puts "Game Over YOU win!!!"
      game_over = true
    end
  end
  unless game_over
    if(moves_left > 0) #no moves left
      if(next_turn == @player) #from comp_turn method
        player_turn
      else
        comp_turn #from player_turn method
    end
	
    else
      puts ""
      puts "Game Over -- DRAW!"
	  game_over = true
    end
  end
end

def comp_turn
  move = comp_find_move
  @slots[move] = @comp
  puts ""
  puts "#{@comp_name} marks #{move.upcase}"
  check_game(@player)
end

def wrong_move
  puts ""
  puts "You must choose an empty slot"
  player_turn
end

def wrong_input
  puts ""
  puts "Please specify a move with the format 'A3' , 'B1' , 'C2' etc."
  player_turn
end

def player_turn
  puts ""
  draw_game
  puts "#{@player_name}, please make a move or type 'exit' to quit"
  STDOUT.flush
  input = gets.chomp.downcase
  if input.length == 2
    a = input.split("")
    if(['a','b','c'].include? a[0])
      if(['1','2','3'].include? a[1])
        if @slots[input] == " "
          @slots[input] = @player
          puts ""
          puts "#{@player_name} marks #{input.upcase}"
		  #puts times.times_in_column
          check_game(@comp)
        else
          wrong_move
        end
      else
        wrong_input
      end
    else
      wrong_input
    end
  else
    wrong_input unless input == 'exit'
  end
 end

def times_in_column arr, item
  times = 0
 #arr.each do |i|
 for i in [arr] do
    if @slots[i] != " "
	  times += 1
    unless @slots[i] == item || @slots[i] == " "
      return 0
    end
	end
	return times
  end
end

def empty_in_column arr
  arr.each do |i|
    if @slots[i] == " "
      return i
    end
  end
end

def comp_find_move

#defending against the player first
for column in [@winnings] do
  if times_in_column(column, @player) == 2
    return empty_in_column column
  end
end

#choosing best comp choice 2 in column
for column in [@winnings] do
  if times_in_column(column, @comp) == 2
    return empty_in_column column
  end
end

#third best comp choice only one in column
for column in [@winnings] do
  if times_in_column(column, @comp) == 1
    return empty_in_column column
  end
end

#choosing an empty slot
k = @slots.keys;
j = rand(k.length)
if @slots[k[j]] == " "
  return k[j]
else
  #first empty slot
  @slots.each { |k,m| return k if m == " " }
end
end



 
#actually initiating the methods
 if(@player == 'X')
	puts ''
	puts "#{@player_name} has the first turn"
	player_turn
else
	puts ''
	puts "#{@comp_name} has the first turn"
	comp_turn
end
