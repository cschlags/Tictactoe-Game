#since this class will be the one being run by human require_relative board and player 
require 'active_support/all'
require_relative "./player"
require_relative "./computer"

class Game
  attr_accessor :board, :slots

  def initialize
    #runs all the varaibles from previous version
    create_game
  end

  def create_game
    #designs board found in board.rb previously
    design_board
    #designs players found previously in player.rb
    create_players
    #once players and board are created start the game
    game_play
  end

  def design_board
    #customizable board size
    puts "How big would you like the board to be? < 3 / 4 / 5 >"
    #changes slots size to integer
    @slots = gets.to_i
    if @slots <= 0 || @slots > 5
      puts "That is not valid."
      design_board
    end
    #creates array of slot ^ 2. eg. 5 becomes 1..25
    @board = (1..@slots**2).to_a
  end

  def create_players
    #decides if you will play computer or human
    puts "Would you like your opponent to be a human or computer? < h / c>"
    response = gets.chomp
    if response == "h"
      @player1 = Player.new(self)
      @player2 = Player.new(self)
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
      @player1 = Player.new(self)
      @player2 = Computer.new(self)
    elsif response == "computer"
      @player1 = Computer.new(self)
      @player2 = Player.new(self)
    elsif response == "random"
      #from past code 
      #determine who is player1 and who is player2
      #.5 because 2 options
      @player1 = rand() > 0.5 ? Computer.new(self) : Player.new(self)
      @player2 = "#{@player1.class}" == "Computer" ? Player.new(self) : Computer.new(self)
    else
      puts "Invalid input"
      random_start
    end
  end

  def print_board
    board = @board.in_groups_of(@slots)
    printed_board = "\n\n"
    board.each_with_index do |row, i|
      row.each do |char|
        #designing the actual board
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
    #set turns equal to 0
    @turn = 0
    #will need to check for winner in this method to ensure it does not contiue playing
    winner = false
    #if winner is false and turns are less than slots?
    while winner == false && @turn < @slots**2
      print_board
      if @turn == (@slots**2)-1
        #else if turns are equal to slots and no winner then draw
        puts "It's a tie!"
        play_again
      else
        #get the player move
        get_player_moves
      end
      #turns will need to be increased somewhere
      @turn += 1
    end
  end

  def get_player_moves
    #players move after each other
    puts "Player #{(@turn%2)+1}"
    #ie. if player1 moves then player2 will move
    if @turn % 2 == 0 
      @player1.play_move("X")
    else
      @player2.play_move("O")
    end
    #check if someone has won
    winner_check
  end

  def winner_check
    #since there are no hard-coded wins there should be a line column diagonal win
    board = @board.in_groups_of(slots)
    #need to keep track of the players points
    @point = 1
    if line(board) || column(board) || diagonal(board)
      @winner = true
      puts "Player #{(@turn%2)+1} wins!"
      play_again
    end
  end

  def line(board)
    (0...@slots).each do |y|
      (0...(@slots-1)).each do |x|
        #if one slot is equal to the slot to the right add point
        @point += 1 if board[y][x] == board[y][x+1]
      end
      if points == true
        return true
      end   
    end
    false
  end
  
  def column(board)
    #going through each slot
    (0...@slots).each do |x|
      #going through each slot
      (0...(@slots-1)).each do |y|     
        #if one slot is equal to the slot below it add point
        @point += 1 if board[y][x] == board[y+1][x]
      end
      if points == true
        return true
      end   
    end
    false
  end

  def diagonal(board)
    (0...(@slots-1)).each do |i|
      #if board slot is equal going in downward right fashion
      @point += 1 if board[i][i] == board[i+1][i+1]
    end

    if points == true
      true
    end

    (0...(@slots-1)).each do |i|
      #diagonal board slot is equal going in downward left fashion
      @point += 1 if board[@slots-(i+1)][i] == board[@slots-(i+2)][i+1]
    end

    points == true ? true : false
  end

  def points
    if @point == @slots 
      true
    else 
      @point = 1
    end 
  end
end
#create the new game
game = Game.new