require 'pry'

class Computer

  def initialize(game)
    #since I no longer have a board or simple computer player I need to change this
    @game = game
  end

  #from player
  def play_move(mark)
    #take the symbol "x" or "o"
    puts "The computer is moving..."
    sleep 2

    if @game.difficulty == "beginner"
      move = beginner_move
    elsif @game.difficulty == "hard"
      move = hard_move
    else
      move = extreme_move
    end

    #the index of the game board gets that mark
    @game.board[move] = mark
  end

  def beginner_move
    @game.board.select { |i| i.is_a?(Integer) }.sample - 1
  end 

  def hard_move
    # if @slots%2 = 0 then the number is even so there is no center
    if @game.slots%2 == 0
          binding.pry
    else
    # if @slots%2 != 0 then the number is odd so there is a center
      # check center
      if @game.boards[@game.slots/2][@game.slots/2].is_a?(Integer)
        @game.boards[@game.slots/2][@game.slots/2]
      # check top left
      elsif @game.boards.first.first.is_a?(Integer)
        @game.boards.first.first
      # check bottom right
      elsif @game.boards.last.last.is_a?(Integer)
        @game.boards.last.last
      # check top right
      elsif @game.boards.first.last.is_a?(Integer)
        @game.boards.first.last
      # check bottom left
      elsif @game.boards.last.first.is_a?(Integer)
        @game.boards.last.first
      else
        @game.board.select { |i| i.is_a?(Integer) }.sample - 1
      end
    end



    # use original logic, go for center then go for corners, then everything else is random
    # should incoporate for all board sizes
    # if @game.board[4].is_a?(Integer)
    #   4
    # elsif !@game.board[5].is_a?(Integer) && @game.board[8].is_a?(Integer)
    #   8
    # elsif @game.board[0].is_a?(Integer)
    #   0
    # elsif @game.board[6].is_a?(Integer)
    #   6
    # elsif @game.board[1].is_a?(Integer)
    #   1 
    # elsif !@game.board[1].is_a?(Integer) && @game.board[2].is_a?(Integer)
    #   2
    # elsif @game.board[3].is_a?(Integer)
    #   3
    # elsif @game.board[5].is_a?(Integer)
    #   5
    # elsif @game.board[7].is_a?(Integer)
    #   7
    # end
  end

  def extreme_move
    # use center, then block user, then corners, then block user, then try to win a line
    # this should be kind of similar to my original-original code
    # should incoporate for all board sizes
  end
end