# CS 3270 instructor
# Vanderbilt University

require_relative "sudoku"
require "test/unit"
 
class TestSudoku < Test::Unit::TestCase

    def test_sudoku_1
        puzzle = Sudoku.new
        puzzle.loadFromFile("txt/sudoku-test1.txt")
        puzzle.solve(0, 0)

        solution = Sudoku.new
        solution.loadFromFile("txt/sudoku-test1-solution.txt")

        assert_equal(puzzle.sudokuBoard, solution.sudokuBoard)
    end

    def test_sudoku_2
        puzzle = Sudoku.new
        puzzle.loadFromFile("txt/sudoku-test2.txt")
        puzzle.solve(0, 0)

        solution = Sudoku.new
        solution.loadFromFile("txt/sudoku-test2-solution.txt")

        assert_equal(puzzle.sudokuBoard, solution.sudokuBoard)
    end

    def test_impossible
        puzzle = Sudoku.new
        puzzle.loadFromFile("txt/sudoku-impossible.txt")
        assert(!puzzle.solve(0, 0))
    end

end