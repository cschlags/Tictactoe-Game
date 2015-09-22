class Board
  #need to add attr_accessor to access @slots
  attr_accessor :slots

  #has hash/array of winning places
  WINNING = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

 #initialize class with the set board positions
  def initialize # board position starts from 1 to 9
    @slots = {"1" => " ", "2" => " ", "3" => " ",
              "4" => " ", "5" => " ", "6" => " ",
              "7" => " ", "8" => " ", "9" => " "}
  end

  #creates the board that the user will see
  def user_display
    puts ""
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
    puts ""
  end

  def show
    #shows board's .each slots index will show "x" or "o"
    puts ""
    puts " #{self.slots["1"]} | #{self.slots["2"]} | #{self.slots["3"]} "
    puts "-----------"
    puts " #{self.slots["4"]} | #{self.slots["5"]} | #{self.slots["6"]} "
    puts "-----------"
    puts " #{self.slots["7"]} | #{self.slots["8"]} | #{self.slots["9"]} "
    puts ""
  end
end

