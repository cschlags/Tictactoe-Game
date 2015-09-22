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
  #also take in game.rb data
  def move(board, position, game)
        board.positions_with_values[position] = self.mark
    board.display
    winner = engine.check_winner(board)
    if winner != "No One"
      engine.display_winner(self.mark)
    end
    #make the board.position = to the self.symbol eg. "x" or "o"
    board.slots[position] = self.symbol
    #display board
    board.show
    #check if winner
    winner = game.check_winner(board)
    game.show_winner(winner)
  end

  def computer_move(board, game)
    #tells user the robot goes
    #checks the smartest move returns number
    # make that board.number equal to 'O'
    #check if winner?
    #if there is a winner
      #return board.show
      #return winner show method with the "O"
    #else
      #display board
    #end
  end
end
