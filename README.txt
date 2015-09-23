**Christina Leuci Tic Tac Toe Challenge**
Algorithm Explanation:
  For my admittance to Flatiron School I had previously made a TicTacToe Game, admittedly it was much simpler than it is now. I decided that after producing an object-oriented program I should change the logic I had used in the previous version.

  The beginning of the win detection algorithm found in the check_winner() method begins in "game.rb" after each player has moved. I created a point system that is run using three methods, one for a win moving right to left, one for a win moving up and down, and one for a win moving diagonally. These methods will work regardless of the size of the board.

  ##Line Method
  The line() method takes in the board array. It will move through each index of the board and then through each index of the arrays in right to left fashion by increasing the second index. If we are looking at the example:

                  [["1","2","3"],
                   ["X","X","X"],
                   ["7","8","9"]]

  The line() method will begin at the first index board[0] which contains ["1","2","3"], then the method will loop through each index comparing that variable to the next. 

      eg. Is "1" == "2" >> no ; is "2" == "3" >> no ; thus no points are accumulated.

  In the second index board[1] the winning line is located. The line() method will go through each index and the points will accumulate. Once it has completed it's loops through the board the points() method is called.

  Inside the points() method the @point variable from the line() method is compared to the number of @slots in the board, using the example above the @slots variable would be equal to 3. In the above example the player who uses "X" would win but in the case that @point is not equal to @slots the @point variable becomes 1 again.

  ##Column Method
  Similarly to the line() method the column() method takes in the board array moving through each index of the board. The difference between the two methods is that the column() method compares each array's indexes against the other array's indexes. If we are looking at the example:

                  [["X","2","3"],
                   ["X","5","6"],
                   ["X","8","9"]]

  The column() method will begin in the first array board[0] which contains ["X","2","3"] and then look at each index of that array. The method will then compare board[0][0] ("X") to board[1][0] ("X"). Each time the variables are equal to each other the @point variable is increased. When the loop of the board has been completed the points() method will be called, from there it follows the same process as the the explanation of the line() method when the points() method is called.

  ##Diagonal Method
  The diagonal() method was a bit more complicated, I needed to create a comparation for both a diagonal moving downward and to the right or downward and to the left. If we are looking at the example:

                  [["X","2","3"],
                   ["4","X","6"],
                   ["7","8","X"]]

  The diagonal() method will begin at the first index of the first array of the board. At this point board[i][i] will be board[0][0] ("X") and it will be compared to board[i+1][i+1] which will be board[1][1] ("X"). These two variables are equal and a @point is added. This loop will continue through the board when the points() method is called. Using the example above the @point variable will be equal to 3 which is equal to @slots.
