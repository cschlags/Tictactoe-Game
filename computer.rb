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
    move = mark_move
    #the index of the game board gets that mark
    @game.board[move] = mark
  end

  def mark_move
    if @game.board[4].is_a?(Integer)
      4
    elsif !@game.board[5].is_a?(Integer) && @game.board[8].is_a?(Integer)
      8
    elsif @game.board[0].is_a?(Integer)
      0
    elsif @game.board[6].is_a?(Integer)
      6
    elsif @game.board[1].is_a?(Integer)
      1 
    elsif !@game.board[1].is_a?(Integer) && @game.board[2].is_a?(Integer)
      2
    elsif @game.board[3].is_a?(Integer)
      3
    elsif @game.board[5].is_a?(Integer)
      5
    elsif @game.board[7].is_a?(Integer)
      7
    else
      @game.board.select { |i| i.is_a?(Integer) }.sample - 1
    end
  end 
end