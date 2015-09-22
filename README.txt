**Christina Leuci Tic Tac Toe Challenge**
Algorithm Explanation:
  For my admittance to Flatiron School I had previously made a TicTacToe Game, admittedly it was much simpler than it is now. I decided that after producing an object-oriented program I should change the logic I had used in the previous version.

  The beginning of the win detection algorithm found in the check_winner() method begins in "game.rb" after each player has moved. I have brief comments in the code explaining as each step happens but here is a more concise description of the process:
  When the check_winner() method is called each player begins with 0 points. The logic dictates to move through each index of the Board, each player


    #each player should start off with 0 points, each symbol that is part of the winning
    #places should gain that player a point.
    # once a player has 3 points the if should break and moves onto stop method
    #to congratulate winner or say draw
Please run "rspec" to see tests





Challenge #1

Tic Tac Toe

Summary: Create a tic tac toe application using Ruby.

Core Requirements:
- You should be able to play against the computer.
- Explain your algorithm for win detection (don't just hard code winning patterns).
- You should be able to pick who is the computer player and who is the human player.
- The application should run in the terminal only (no web interface)
- The computer does not need to be smart.  Randomly selecting an available space is fine.
- When the game is done, it should announce who the winner is and ask if you want to play again.
- The application should be built using object oriented design.


Suggestions:
- Make the grid size variable
- Keep your code DRY
- Feel free to show off
- Test it using RSpec or MiniTest
- Make the computer player smart
- Randomize who gets the first turn between computer and human players

The suggestions are just suggestions if you want to play around or show us some cool stuff.  Have fun with it!  We look forward to seeing what you come up with.  Please make sure that you get all of the core requirements finished before moving on to the extras.

For this challenge, you do not need a database or 3rd party gems.  If you want to use active_support core extensions to simplify things a bit then that is okay.

Please try to get the challenge finished inside of 2 days.  If you think you'll need more time then please let us know.