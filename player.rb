class Player
  def initialize(game)
    #since I no longer have a board or simple computer player I need to change this
    @game = game
  end

  def play_move(mark)
    puts "Where would you like to move?"
    #need to get the board index that includes that number
    slot = slot_play(@game.board)
    @game.board[slot] = mark
    #another method?
  end

  def slot_play(board) 
    #needs to get the slot into a number
    slot = gets.to_i
    # if number is greater than the amount of slots 
    while slot < 1 or slot > @game.slots**2
      #return invalid input
      puts "Invalid game slot. Try again"
      slot = gets.to_i
    end
    #if number is taken
    if @game.board[slot-1].is_a?(String)
      #return taken
      puts "Someone is there. Try again"
      slot = gets.to_i
    end
    #redo
    slot -= 1
  end
end
