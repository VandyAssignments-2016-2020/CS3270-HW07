# Name: Christopher Glenn
# VUnetID: glennca1
# Email: christopher.a.glenn@vanderbilt.edu
# Class: CS 3270 - Vanderbilt University
# Date: 12/05/19
# Honor Statement: I have neither given nor received unauthorized help on this assignment

# Description: This is a sudoku solver implemented in Ruby

require_relative "sudoku"

puzzle = Sudoku.new

puzzle.loadFromFile("txt/sudoku-test1.txt")

print "\nHere is the initial board:\n\n"
puzzle.printSudokuBoard
starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)

if puzzle.solve(0,0) then
	ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
	elapsed = ending - starting
	print "\nHere is the solved board!\n\n"
	puzzle.printSudokuBoard
	
	print "\nPuzzle solved in " + elapsed.to_s + " seconds.\n"
else
	print "\nNo solution. \n\n"
end