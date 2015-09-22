#since this class will be the one being run by human require_relative board and player 
require_relative "./player"
require_relative "./board"

class Game
  attr_accessor :board, :slots

  def initialize
    create_game
  end

  def create_game
    design_board
    create_players
    game_play
    # #will need to have defining variables for new players, "x" and "o"?
    # x_player = Player.new("X")
    # o_player = Player.new("O")
    # board = design_board
    # #game needs to have a start and stop method for if someone wins
    # print_board
    # start(x_player, o_player) #should start the game immediately being the main method displaying and user first experience of player choosing
    # stop #put back in to have a draw
  end

  def design_board
    puts "How big would you like the board to be? < 3 / 4 / 5 >"
    @slots = gets.to_i
    if @slots <= 0 || @slots > 5
      puts "That is not valid."
      design_board
    end    
    @board = (1..@slots**2).to_a
  end

  def create_players
    puts "Would you like your opponent to be a human or computer? < h / c>"
    response = gets.chomp
    if response == "h"
      @playerA = Player.new(self)
      @playerB = Player.new(self)
    elsif response == "c"
      random_start
    else
      puts "Invalid input"
      create_players
    end
  end

  def random_start
    puts "Who should go first? < you / computer / random"
    response = gets.chomp
    if response == "you"
      @playerA = Player.new(self)
      @playerB = Player.new(self)
    elsif response == "computer"
      @playerA = Computer.new(self)
      @playerB = Player.new(self)
    elsif response == "random"
      #from past code 
      #determine who is playerA and who is playerB
      #.5 because 2 options
      @playerA = rand() > 0.5 ? Computer.new(self) : Player.new(self)
      @playerB = @playerA == Computer.new(self) ? Player.new(self) : Computer.new(self)
    else
      puts "Invalid input"
      random_start
    end
  end

  def print_board
    board = @board.each_slice(slots) {|a| p a}.to_a
    printed_board = "\n"
    board.each_with_index do |row, i|
      row.each do |char|
        printed_board += char.to_s.rjust(@slots**2.to_s.length, " ")
      end
      printed_board += "\n\n" 
    end
    puts printed_board
  end

  def play_again
    puts "Play again? y/n"
    response = gets.chomp
    response == "y" ? Game.new : exit
  end

  def game_play
    @turn = 0
    @winner = false
    while @winner == false && @turn < @slots**2
      print_board
      if @turn == (@slots**2)-1
        puts "It's a tie!"
        play_again
      else
        get_moves
      end
      @turn += 1
    end
  end

  def get_moves
    puts "Player #{(@turn%2)+1}"
    if @turn % 2 == 0 
      @playerA.move("X")
    else
      @playerB.move("O")
    end
   check_for_winner
  end

  def check_for_winner
    board = @board.each_slice(slots) {|a| p a}.to_a
    @tally = 1
    if vertical_win?(board) || horizontal_win?(board) || diagonal_win?(board)
      @winner = true
      print_board
      puts "Player #{(@turn%2)+1} wins!"
      play_again
    end
  end

  def vertical_win?(board)
    (0...@slots).each do |x|
      (0...(@slots-1)).each do |y|     
        @tally += 1 if board[y][x] == board[y+1][x]
      end
      if check_tally == true
        return true
      end   
    end
    false
  end

  def horizontal_win?(board)
    (0...@slots).each do |y|
      (0...(@slots-1)).each do |x|   
        @tally += 1 if board[y][x] == board[y][x+1]
      end
      if check_tally == true
        return true
      end
    end
    false
  end

  def diagonal_win?(board)
    (0...(@slots-1)).each do |i|
      @tally += 1 if board[i][i] == board[i+1][i+1]
    end
    if check_tally == true
      return true
    end
    (0...(@slots-1)).each do |i|
      @tally += 1 if board[@slots-(i+1)][i] == board[@slots-(i+2)][i+1]
    end
    check_tally == true ? true : false
  end

  def check_tally
    if @tally == @slots 
      true
    else 
      @tally = 1
    end 
  end

  # def play_move(current, board) #the move that each player uses during their turn
  #   #is the player a human? eg. "x_player"?
  #   if current.symbol == "X"
  #     correct = true

  #     while correct do
  #     #if true then ask where they should move using the board numbers
  #       print_board
  #       puts ""
  #       print "Where do want to move? <1-9>: "
  #       position = gets.chomp
  #       #if the position is wrong or occupied then return to that print
  #       if !position.to_i.between?(1, 9)
  #         puts "Please use 1..9"
  #         correct = true
  #       elsif %w[X O].include?board.slots[position]
  #         puts "A player chose that spot, please choose an empty space"
  #         correct = true
  #       else
  #         correct = false
  #       end
  #     end

  #     #else player is moved using player.move (board, position)?
  #     current.move(board, position, self)
  #   #if not a human? eg. "o_player"
  #   else
  #     current.computer_move(board, self)
  #     #then use computer algorithm player.computer_move(board)?
  #   end
  # end

#   def check_winner(board) #after each move check if there is a winner
#     #each player should start off with 0 points, each symbol that is part 
#     #of the winning places should gain that player a point.
#     # once a player has 3 points the if should break and moves onto stop 
#     #method to congratulate winner or say draw
#     x_count = 0
#     o_count = 0
#     #go through each board winning slot
#     Board::WINNING.each do |winning_slot|
#       #go through each index of those winning slots (it's a double array)
#       winning_slot.each do |index|
#         #if the board slot has an x
#         if board.slots["#{index}"] == "X"
#           x_count = x_count + 1
#         #if board slot has an o
#         elsif board.slots["#{index}"] == "O"
#           o_count = o_count + 1
#         end
#       end
#       # this should be part of that winning slot .each
#       if x_count == 3 or o_count == 3
#         break
#       else
#         x_count = 0
#         o_count = 0
#       end
#     end
#     #outslots of winning slot .each
#     if x_count == 3
#       return "X"
#     elsif o_count == 3
#       return "O"
#     end
#     return "no"
#   end

#   def show_winner(winner)
#     puts "Results"
#     if winner == "X"
#       puts "Congratulations! You won!"
#       puts ""
#       play_again
#     else
#       puts "Boo you lost!"
#       puts ""
#       play_again
#     end
#     exit
#   end
# end
end
#create the new game
game = Game.new