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
      @player2 = Player.new(self)
    elsif response == "computer"
      @player1 = Computer.new(self)
      @player2 = Player.new(self)
    elsif response == "random"
      #from past code 
      #determine who is player1 and who is player2
      #.5 because 2 options
      @player1 = rand() > 0.5 ? Computer.new(self) : Player.new(self)
      @player2 = @player1 == Computer.new(self) ? Player.new(self) : Computer.new(self)
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
    #winner equals someone?
  end

  def get_player_moves
    #players move after each other
    puts "Player #{(@turn%2)+1}"
    #ie. if player1 moves then player2 will move
    if @turn % 2 == 0 
      @player1.move("X")
    else
      @player2.move("O")
    end
    #winner_check?
    winner_check
  end

  def winner_check
    #since there are no hard-coded wins there should be a line column diagonal win
    print_board
    puts "Player #{(@turn%2)+1} wins!"
    play_again
  end
end
#create the new game
game = Game.new