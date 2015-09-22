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

    #make the board.position = to the self.symbol eg. "x" or "o"
    board.slots[position] = self.symbol
    #display board
    board.show
    #check if winner
    winner = game.check_winner(board)
    if winner != "no"
      game.show_winner(winner)
    end
  end

  def computer_move(board, game)
    #tells user the robot goes
    puts "the computer is playing"
    #checks the smartest move returns number
    slot = smart_move(board)
    # make that board.number equal to 'O'
    board.slots["#{slot}"] = "O"
    #check if winner?
    winner = game.check_winner(board)

    #if there is a winner
    if winner != "no"
      #return board.show
      board.show
      #return winner show method with the "O"
      game.show_winner(winner)
    else
      #display board
      board.show
    end
  end

  def smart_move(board)
    #if computer is able to have a smart move?
    #testing the smartest move using "X"
    if !final_move(board, "X").nil?
      return final_move(board, "X")
    end

    #testing the smartest move using "O"
    if !final_move(board, "O").nil?
      return final_move(board, "O")
    end

    random_play = true
    #do a random play
    while random_play do
      rand = 1 + rand(8)
      if board.slots["#{rand}"] != "X" and board.slots["#{rand}"] != "O"
        board.slots["#{rand}"] = "O"
        return rand
        random_play = false
      end
    end
  end

  def final_move(board, symbol)
    # should go through the winning slots from board
    Board::WINNING.each do |place|
    #   # if the computer has any x's or o's in a winning slot they should play that slots array
        order = [[0, 1, 2], [0, 2, 1], [1, 2, 0]]
        order.each do |slot|
          if (board.slots["#{place[slot[0]]}"] == symbol) and (board.slots["#{place[slot[1]]}"] == symbol)
            if board.slots["#{place[slot[2]]}"] == " "
              return place[slot[2]]
            end
          end
        end
    end
    #return nil to go to rand above
    return nil
  end
end
