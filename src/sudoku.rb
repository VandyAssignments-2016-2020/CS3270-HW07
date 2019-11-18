# CS 3270 instructor
# Vanderbilt University

# Name:
# VUnetID:
# Email:
# Class: CS 3270 - Vanderbilt University
# Date:
# Honor Statement:

# Description:

class Sudoku

    # Class constant.
    BOARD_SIZE = 9
    ROWS = 9
    COLS = 9
    GRID_SIZE = 3

    # Initialize array.
    def initialize
        @sudokuBoard = [[0,0,0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0,0,0]]
    end

    # Getter method to get the board.
    #
    # @return The Sudoku board in its current state.
    def sudokuBoard
        @sudokuBoard
    end

    # Print the board.
    def printSudokuBoard
        for row in 0..BOARD_SIZE - 1
            for col in 0..BOARD_SIZE - 1
                print @sudokuBoard[row][col].to_s + " "

                if col == 2 or col == 5 then
                    print "| "
                end
            end

            print "\n"

            if row == 2 or row == 5 then
                print "------+-------+------\n"
            end
        end
    end

end
