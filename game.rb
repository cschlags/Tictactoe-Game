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
    #set turns equal to 0
    #will need to check for winner in this method to ensure it does not contiue playing
    #if winner is false and turns are less than slots?
      #get the player move
    #else if turns are equal to slots and no winner then draw
    #else winner equals someone
    #turns will need to be increased somewhere
  end
end
#create the new game
game = Game.new