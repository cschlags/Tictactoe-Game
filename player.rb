class Player
  #controls the symbol "X" or "O"
  attr_accessor :symbol

  def initialize(symbol) # defines whether player has an "x" or "o"
    @symbol = symbol
  end
  #will have both the human and computer
  #controls the moves
  #controls computer algorithm

  #take in board and position
  def move(board, position)
    #make the board.position = to the self.symbol eg. "x" or "o"
    #display board
    #check if winner
    #display winner (create that method)
  end


  def computer_move(board)
  end
  ##FROM original game.rb##
  # #actually initiating the methods
#  if(@player == 'X')
#   puts ''
#   puts "#{@player_name} has the first turn"
#   player_turn
# else
#   puts ''
#   puts "#{@comp_name} has the first turn"
#   comp_turn
# end


# # determine who is X or O
# # use .5 because only 2 options [x or o]

# @comp = rand() > 0.5 ? 'X' : 'O'
# @player = @comp == 'X' ? 'O' : 'X'

# # player names; introduction
# @comp_name = "Computer"
# puts "TIC TAC TOE"
# puts "Player, what is your name?"
# STDOUT.flush
# @player_name = gets.chomp

# def comp_turn
#   move = comp_find_move
#   @slots[move] = @comp
#   puts ""
#   puts "#{@comp_name} marks #{move.upcase}"
#   check_game(@player)
# end

# def wrong_move
#   puts ""
#   puts "You must choose an empty slot"
#   player_turn
# end

# def wrong_input
#   puts ""
#   puts "Please specify a move with the format 'A3' , 'B1' , 'C2' etc."
#   player_turn
# end

# def player_turn
#   puts ""
#   draw_game
#   puts "#{@player_name}, please make a move or type 'exit' to quit"
#   STDOUT.flush
#   input = gets.chomp.downcase
#   if input.length == 2
#     a = input.split("")
#     if(['a','b','c'].include? a[0])
#       if(['1','2','3'].include? a[1])
#         if @slots[input] == " "
#           @slots[input] = @player
#           puts ""
#           puts "#{@player_name} marks #{input.upcase}"
#       #puts times.times_in_column
#           check_game(@comp)
#         else
#           wrong_move
#         end
#       else
#         wrong_input
#       end
#     else
#       wrong_input
#     end
#   else
#     wrong_input unless input == 'exit'
#   end
#  end

# def times_in_column arr, item
#   times = 0
#  #arr.each do |i|
#  for i in [arr] do
#     if @slots[i] != " "
#     times += 1
#     unless @slots[i] == item || @slots[i] == " "
#       return 0
#     end
#   end
#   return times
#   end
# end

# def empty_in_column arr
#   arr.each do |i|
#     if @slots[i] == " "
#       return i
#     end
#   end
# end

# def comp_find_move

# #choosing best comp choice 2 in column
# for column in [@winnings] do
#   if times_in_column(column, @comp) == 2
#     return empty_in_column column
#   end
# end

# #defending against the player first
# for column in [@winnings] do
#   if times_in_column(column, @player) == 2
#     return empty_in_column column
#   end
# end

# #third best comp choice only one in column
# for column in [@winnings] do
#   if times_in_column(column, @comp) == 1
#     return empty_in_column column
#   end
# end

# #choosing an empty slot
# k = @slots.keys;
# j = rand(k.length)
# if @slots[k[j]] == " "
#   return k[j]
# else
#   #first empty slot
#   @slots.each { |k,m| return k if m == " " }
# end
# end
# def moves_left
#   slots = 0
#   @slots.each do |k, v|
#     slots += 1 if v == " "
#   end
#   slots
#  end

end
