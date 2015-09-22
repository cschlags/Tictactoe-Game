#since this class will be the one being run by human require_relative board and player 
require_relative "./board"
require_relative "./player"

class Game
  #display board created in ./board
  #ask player if first, second, or rand
  #players must go one after the other
  #have winning / losing / match method(s)
  #play/move method
  #check for winner after each move

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
