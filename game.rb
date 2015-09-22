#since this class will be the one being run by human require_relative board and player 
require_relative "./board"
require_relative "./player"

class Game
  def start(x_player, o_player, board)
    #player sees board before this

    #first/second is easier. add rand later
    print "Do you want to play first? <y/n>: "
    response = gets.chomp

    #if the answer is 'n' then current is 'o_player'
    #if answer is 'y' then current is 'x_player'
    if %w[Y y].include?(response)
      current = x_player
    else
      current = o_player
    end

    #access the play method, the first moves. Should happen 9 times because there are nine slots
    9.times do
      #which player
      if current == x_player
        #player moves
        play(current, board)
        #switches the players
        current = o_player
      else
        #player moves
        play(current, board)
        #switches the players
        current = x_player
      end
    end
  end

  def stop
    puts "The Match was a draw"
    puts ""
    puts "Want to try again?"
  end

  def play(current, board) #the move that each player uses during their turn
    #is the player a human? eg. "x_player"?
    if current.symbol == "X"
      correct = true

      while correct do
      #if true then ask where they should move using the board numbers
        puts ""
        print "Where do want to move? <1-9>: "
        position = gets.chomp
        #if the position is wrong or occupied then return to that print
        if !position.to_i.between?(1, 9)
          puts "Please use 1..9"
          correct = true
        elsif %w[X O].include?board.slots[position]
          puts "A player chose that spot, please choose an empty space"
          correct = true
        else
          correct = false
        end
      end

      #else player is moved using player.move (board, position)?
      current.move(board, position, self)
    #if not a human? eg. "o_player"
    else
      current.computer_move(board, self)
      #then use computer algorithm player.computer_move(board)?
    end
  end

  def check_winner(board) #after each move check if there is a winner
    #each player should start off with 0 points, each symbol that is part of the winning
    #places should gain that player a point.
    # once a player has 3 points the if should break and moves onto stop method
    #to congratulate winner or say draw
    x_count = 0
    o_count = 0
    #go through each board winning slot
    Board::WINNING.each do |winning_slot|
      #go through each index of those winning slots (it's a double array)
      winning_slot.each do |index|
        #if the board slot has an x
        if board.slots["#{index}"] == "X"
          x_count = x_count + 1
        #if board slot has an o
        elsif board.slots["#{index}"] == "O"
          o_count = o_count + 1
        end
      end
      # this should be part of that winning slot .each
      if x_count == 3 or o_count == 3
        break
      else
        x_count = 0
        o_count = 0
      end
    end
    #outside of winning slot .each
    if x_count == 3
      return "X"
    elsif o_count == 3
      return "O"
    end
    return "no"
  end

  def show_winner(winner)
    puts "Results"
    if winner == "X"
      puts "Congratulations! You won!"
      puts ""
      puts "Want to try again?"

    else
      puts "Boo you lost!"
      puts ""
      puts "Want to try again?"
    end
    exit
  end
end

#display board created in ./board
#create the new game and new player
game = Game.new

#will need to have defining variables for new players, "x" and "o"?
x_player = Player.new("X")
o_player = Player.new("O")
board    = Board.new
board.user_display
#game needs to have a start and stop method for if someone wins
game.start(x_player, o_player, board) #should start the game immediately being the main method displaying and user first experience of player choosing
game.stop #put back in to have a draw