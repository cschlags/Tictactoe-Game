#since this class will be the one being run by human require_relative board and player 
require_relative "./board"
require_relative "./player"

class Game
  #display board created in ./board
  #create the new game and new player
  game = Game.new

  #will need to have defining variables for new players, "x" and "o"?
  x_player = Player.new
  o_player = Player.new
  board    = Board.new
  board.user_display
  #game needs to have a start and stop method for if someone wins
  game.start(x_player, o_player, board) #should start the game immediately being the main method displaying and user first experience of player choosing
  game.stop #should stop the game when the player wins/loses/ties?
  def start(x_player, o_player, board)
  end

  def stop
    puts "Lose/Win/Match"
  end

  def play #the move that each player uses during their turn

  end

  def check_winner #after each move check if there is a winner

  end

  #ask player if first, second, or rand
  #players must go one after the other

end
# #checking winnings or loses or continuings
# def check_game(next_turn)
#   game_over = false
#   #@winnings.each do |column|
#   for column in [@winnings] do
#     #comp has won?
#     if times_in_column(column, @comp) == 3 #three in a row
# 	  puts ""
#       puts "Game Over Dude, the Computer won!!!"
#       game_over = true
#     end
	
#     #player has won?
#     if times_in_column(column, @player) == 3 #three in a row
# 	  puts ""
#       puts "Game Over YOU win!!!"
#       game_over = true
#     end
#   end
#   unless game_over
#     if(moves_left > 0) #no moves left
#       if(next_turn == @player) #from comp_turn method
#         player_turn
#       else
#         comp_turn #from player_turn method
#     end
	
#     else
#       puts ""
#       puts "Game Over -- DRAW!"
# 	  game_over = true
#     end
#   end
# end
