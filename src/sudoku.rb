# CS 3270 instructor
# Vanderbilt University

# Name: Christopher Glenn
# VUnetID: glennca1
# Email: christopher.a.glenn@vanderbilt.edu
# Class: CS 3270 - Vanderbilt University
# Date: 12/05/19
# Honor Statement: I have neither given nor received unauthorized help on this assignment

# Description: This is the declaration of a sudoku solver 

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
	
	# Load board from file
	def loadFromFile(fileName)
    inFile = File.new(fileName, "r")
    index = 0

    # Iterate over the lines from the file.
    inFile.each_line do |line|
        # line is a string containing one line from the file.

        ### The code to process the line goes here. ###
		vals = line.split
		# The collect block will iterate over each item in vals (strings)
		# and perform the function (convert to int) returning the set as a new array.
		@sudokuBoard[index] = vals.collect { |x| x.to_i }
        index = index + 1
    end
	
	
	# Returns whether a number can be placed in this column
	#
	# @param  col  A number representing the board column
	# @param  num  A number we're checking
	# @return Returns true if the number is valid in the column, false otherwise
	def checkCol(col, num)
		0.upto(BOARD_SIZE-1){
		|row| 
		if num == @sudokuBoard[row][col] then
			return false
		end
		}
		return true

	end
	# Returns whether a number can be placed in this row
	#
	# @param  row  A number representing the board row
	# @param  num  A number we're checking
	# @return Returns true if the number is valid in the row, false otherwise
	def checkRow(row, num)
		disjointSet = @sudokuBoard[row] - [num]
		if disjointSet.length == 9 then
			# Safe to add sum to the row.
			return true
		else
			# Unsafe to add sum to the row, since it already existed there.
			return false
		end
		
	end
	
	# Returns whether a number can be placed in this subgrid
	#
	# @param  row  A number representing the board row
	# @param  col  A number representing the board column
	# @param  num  A number we're checking
	# @return Returns true if the number is valid in the subgrid, false otherwise
	def checkSubgrid(row, col, num)
		x = (row / 3) * 3
		y = (col / 3) * 3

		box = @sudokuBoard[x][y..(y+2)] + @sudokuBoard[x+1][y..(y+2)] + @sudokuBoard[x+2][y..(y+2)]
		disjointSet = box - [num]
		if disjointSet.length == 9 then
			# Safe to add num to the row.
			return true
		else
			# Unsafe to add num to the row, since it already existed there.
			return false
		end
		
	
	
	
	end
	
	# Returns whether a number can be placed per sudoku rules
	#
	# @param  row  A number representing the board row
	# @param  col  A number representing the board column
	# @param  num  A number we're checking
	# @return Returns true if the number is valid in this postion, false otherwise
	def check(row, col, num)
		return checkCol(col,num) && checkRow(row,num) && checkSubgrid(row,col,num)
	
	end
	
	# A recursive backtracking function to solve sudoku boards 
	#
	# @param  row  A number representing the board row
	# @param  col  A number representing the board column
	# @return Returns true if the board is solved, false otherwise
	def solve(row, col)
	if row == 9 then
		return true
	end
	
	if col == 9 then
		return solve(row +1, 0)
	end
	
	if @sudokuBoard[row][col] != 0 then
		return solve(row, col +1)
	end
	
	1.upto(9) {
	|num|
	
	if check(row,col,num) then
		@sudokuBoard[row][col] = num
		if solve(row, col+1) then
			return true
		end
	end
	}
	
	@sudokuBoard[row][col] = 0
	return false
	
	
	end
		

    inFile.close
end

end
