#!/usr/bin/env ruby

@slots = {
  "a1"=>" ","a2"=>" ","a3"=>" ",
  "b1"=>" ","b2"=>" ","b3"=>" ",
  "c1"=>" ","c2"=>" ","c3"=>" "
}

@winning = [
  ['a1','a2','a3'],
  ['b1','b2','b3'],
  ['c1','c2','c3'],
  ['a1','b1','c1'],
  ['a2','b2','c2'],
  ['a3','b3','c3'],
  ['a1','b2','c3'],
  ['c1','b2','a3']
]

#rand selection of x and o between player and comp
#use .5 since only two options
@comp = rand() > 0.5 ? 'X' : 'O'
@player = @comp == 'X' ? 'O' : 'X'

#introductions
#STDOUT forces immediately out not held
@comp_name = "Computer"
puts "TIC TAC TOE"
puts "Player, what is your name?"
STDOUT.flush
@player_name = gets.chomp

if(@player == 'X')
  puts ""
  puts "#{@player_name} has the first turn"
  player_turn
else
  puts ""
  puts "The Computer has the first turn"
  comp_turn
end

def draw_board
  puts "============================================================================"
  
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
end

def comp_turn
  move = comp_move
  @slots[move] = @comp
  puts ""
  puts "#{@comp_name} marks #{move.upcase}"
  check_winner(@player)
end

def comp_move
	
def player_on_board arr, item
  times = 0
  arr.each do |i|
    times += 1 if @slots[i] == item
    unless @slots[i] == item || @slots[i] == " "
      #oppisite piece is in column so column cannot be used for win.
      #therefore, the strategic thing to do is choose a dif column so return 0.
      return 0
    end
  end
  times
end

def empty_in_column arr
  arr.each do |i|
    if @slots[i] == " "
      return i
    end
  end
end

@winning.each do |column|
  if player_on_board(column, @comp) == 2
    return empty_in_column column
  end
end

@winning.each do |column|
  if player_on_board(column, @player) == 2
    return empty_in_column column
  end
end

@winning.each do |column|
  if player_on_board(column, @comp) == 1
    return empty_in_column column
  end
end

#no strategic spot found so just find a random empty
k = @slots.keys;
i = rand(k.length)
if @slots[k[i]] == " "
  return k[i]
else
  #random selection is taken so just find the first empty slot
  @slots.each { |k,v| return k if v == " " }
end
end

def player_turn
  puts ""
  puts " TIC TAC TOE"
  draw_board
  puts ""
  puts " #{@player_name}, please make a move or type 'exit' to quit"
  puts ""
  STDOUT.flush
  input = gets.chomp.downcase
  
  #length = 2 since a move is 2 characters a1
  if input.length == 2
    a = input.split("")
    if(['a','b','c'].include? a[0])
      if(['1','2','3'].include? a[1])
	  
	  #if slots empty put player item in
        if @slots[input] == " "
          @slots[input] = @player
		  puts ""
          puts "#{@player_name} marks #{input.upcase}"
		  
		  #check if a winner > next_turn is comp
          check_winner(@comp)
        else
          move_error
        end
      else
        player_error
      end
    else
      player_error
    end
  else
    player_error unless input == 'exit'
  end
end

#format error
def player_error
  puts ""
  puts "Please specify a move with the format 'A1' , 'B3' , 'C2' etc."
  player_turn
end

#slot error
def move_error
  puts ""
  puts "Please choose an empty space"
  player_turn
end

def check_winner(next_turn)
#nil = false game still goes on
  game_over = nil
  
  #check if an winning groups in column
  @winning.each do |column|
    #comp wins
    if player_on_board(column, @comp) == 3
      puts ""
	  puts "Game Over Dude, the Computer won!!!"
      game_over = true
    end
	
    #player wins
    if player_on_board(column, @player) == 3
      puts ""
	  puts "Oh my gosh!! YOU WON!!!"
      game_over = true
    end
  end
  
  unless game_over
    if(free_moves > 0)
      if(next_turn == @player)
        player_turn
      else
        comp_turn
      end
    else
	  puts ""
      puts "Game Over Man it's a DRAW!"
    end
  end
end


#the amount of empty spaces left on the board
def free_moves
  slots = 0
  @slots.each do |k, g|
    slots += 1 if g == " "
  end
  slots
end
