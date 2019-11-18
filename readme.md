> **The Academic Honor Policy (see Brightspace) is applicable to all work you do in CS 3270/5270.**

# CS 3270: Programming Languages
## Homework 7

Exploring Ruby

## Goals

* Learn how to edit and run Ruby programs.
* Learn some of the string processing capabilities of Ruby.
* Learn some of the array processing capabilities of Ruby.
* Combine the above to create a Sudoku solver in Ruby.

## GitHub notes

Please see [GitHub notes](github_notes.md) for more information on cloning, committing, and pushing repositories.

## Additional Ruby references

* [Ruby installation](https://www.ruby-lang.org/en/documentation/installation)
* [Ruby tutorial](http://www.ruby-lang.org/en/documentation/quickstart)
* [Ruby's Wikipedia entry](http://en.wikipedia.org/wiki/Ruby_programming_language)
* [Ruby Essentials](http://www.techotopia.com/index.php/Ruby_Essentials)
* [Another tutorial](http://www.troubleshooters.com/codecorn/ruby/basictutorial.htm)

## Installing Ruby (Windows only)

If you use a Mac, Ruby is already installed and Ruby programs can be run through the Terminal program.

If you use Windows, visit their [installation page](https://www.ruby-lang.org/en/documentation/installation), which has a link to a Windows installer called **RubyInstaller**.

During the installation process, you should specify that you want Ruby executables added to your path and that you want `.rb` files associated with this Ruby installation. On the last installation screen, uncheck **Run 'ridk install' to install MSYS2 and development toolchain**. We will only be running a Ruby program with standard code.
 
## Style guidelines

* **Names:** Use proper conventions for identifier names. That is, use `UpperCamelCase` for class names, `SCREAMING_SNAKE_CASE` for constants, and `camelCase` for everything else. Also, use meaningful identifier names. For example, a variable that stores a speed value should be called `speed` instead of just `s`.

* **Line lengths:** No lines should exceed 100 columns.

* **Indentation:** Use proper and consistent indentation.

* **Whitespace:** Methods should be separated by at least one empty line.

* **Comments:** Use Javadoc-style comments to document all functions. For your reference, below is an example of Javadoc-style comments for a function.

   ```
  # Returns an Image object that can then be painted on the screen.
  #
  # @param  url  An absolute URL giving the base location of the image.
  # @param  name The location of the image, relative to the url argument.
  # @return The image at the specified URL.
  ```

## 1. Getting started

### Step 1.0

As we work through this exercise, sometimes we will want to know how Ruby behaves in certain instances. To experiment, we will run the Ruby interpreter in a separate window. For Mac, open the Terminal program and type `irb`. For Windows, from your Start menu, select **All Programs | Ruby | Interactive Ruby**. A Ruby interpreter window will pop up. You can also select **Start Command Prompt with Ruby** and then type `irb`. Type Ruby commands into the interpreter to see what they produce. For example, type `6/4` and you will see that you get the answer `1` – telling you that Ruby does integer division just as you experience in C++ and Java. As you progress through this exercise, you are encouraged to try things out in the interpreter window.

### Step 1.1

The result of this assignment will be the files `main.rb` and `sudoku.rb`. Starter code has been included in both files. Data files called `sudoku-test1.txt`, `sudoku-test2.txt`, and `sudoku-impossible.txt` are also provided.

Let's take a quick look at what has already been supplied to you in the `main.rb` and `sudoku.rb` files. Open the files in your favorite text editor. The first thing that we notice is that comments start with the `#` character. Take some time now to fill in the header comments of your files. In `sudoku.rb`, we see a class named `Sudoku` that contains a class constant `BOARD_SIZE` and three methods. The `initialize` method is called when a new `Sudoku` object is created. In this method, a `sudokuBoard` variable has been declared as an instance variable (class instance variables start with `@`). We also see that arrays are distinguished by square brackets `[]` with comma separated items and that multidimensional arrays are simply arrays of arrays.

Next we see a defined getter method, which will return `sudokuBoard`.  Then the `printSudokuBoard` method. Take a moment to look at the code and its syntax. Note the lack of curly braces (C++ and Java syntax) and the lack of parentheses (Lisp syntax). Rather, keywords are used to mark the beginning and end of blocks of code; e.g., `def ... end`, `for ... end`, `if ... end`. As usual, indentation is used to make the code easier to read.

We see that a board is printed using two nested *for-loops*. Each loop defines a loop variable and the range of values for that variable. The double dots, `0..BOARD_SIZE - 1`, indicate an inclusive range (i.e., the loop variable will start at zero and go up to and include the value eight). One could use triple dots, `0...BOARD_SIZE`, to indicate an exclusive range (i.e., the loop variable will start at zero and will go up to, but not include the value of `BOARD_SIZE`). This triple dot notation will be convenient to process all elements of an array or all characters of a string (loop variable goes up to, but not including the length of the array or string).

Inside the double loop nest, we print out a board element using common array indexing. The array element is converted to a printable string using the `to_s` *to string* method. In Ruby, everything is an object, even integers – and so we can do method calls on integers. We concatenate a blank space after each array element. We also print a vertical bar after the secondnd and fifth columns, and also print a horizontal line after the second and fifth rows.

Finally, in `main.rb` we have the main code for the program. It simply calls the creates a `Sudoku` object and calls the `printSudokuBoard` method to print the initial board.

### Step 1.2

Let's run our program. On Windows, select **All Programs | Ruby | Start Command Prompt with Ruby**. On Mac, open the Terminal program. Do not start the Ruby interpreter (i.e., don't type `irb`). If you are in the Ruby interpreter, type `exit`. Navigate to the root folder of the project (use the `cd` command to change directories). Don't go all the way into the `src` folder, just the folder right above it. You can then run the program by typing: `ruby src/main.rb` at the command prompt. Is the output what you expected? I hope so.

At this point, you know how to edit a Ruby program and execute it. That's all a good programmer needs, right?!?! Time to get serious!

## 2. Reading in a board from a file

Reading in data from a file varies greatly from language to language. Thus you will be given the Ruby code to read in a Sudoku board. But the code is given you piece by piece, so that we can learn something along the way. Please pay close attention, as you will need to know how to do these things on your own to write the other methods to complete your Sudoku solver.

### Step 2.1

Copy and paste the following code into your `sudoku.rb` file; place the code inside the `Sudoku` class definition (you may place it at the end of the class).

```Ruby
def loadFromFile(fileName)
    inFile = File.new(fileName, "r")
    index = 0

    # Iterate over the lines from the file.
    inFile.each_line do |line|
        # line is a string containing one line from the file.

        ### The code to process the line goes here. ###

        index = index + 1
    end

    inFile.close
end
```

The above code is the definition of a method called `loadFromFile` that accepts one parameter, which is the location of the file that we want to load. The method creates a `File` object, called `inFile`, and opens the file passed as parameter for reading. We then read the file line by line, binding each line (string data) to the variable `line`. This is accomplished with the `each_line` method of the `File` class. The code above currently does not process the line of data, it only counts them (incrementing the variable `index` on each iteration of the loop). The last statement closes the file.

### Step 2.2

Now we need to add some code to the loop body to process each line of data we have read. Each line should be a string consisting of nine digits separated by blanks. We want to split that long string into nine smaller strings, each containing a single digit. This can be accomplished by the `split` method of the string class. If you have a string called `line` that contains: `"4 0 0 8 0 3 0 0 1"`, the method call `line.split` will return an array:

```Ruby
["4", "0", "0", "8", "0", "3", "0", "0", "1"]
```

Add the following line as the first executable statement inside the `each_line` *do-loop*:

```Ruby
vals = line.split
```

This will create an array of strings and assign it to `vals`. We need to take our array of strings and create an array of corresponding integers. Ruby has some nice constructs that allow automatic iteration over a collection of data. In particular, Ruby's array class has a `collect` method that returns a new array with the results of running a code block once for every element in the collection (very similar to Python's *list comprehensions*). Add the following code as the last addition to the loop body (be sure to add this before the line where `index` is incremented):

```Ruby
# The collect block will iterate over each item in vals (strings)
# and perform the function (convert to int) returning the set as a new array.
@sudokuBoard[index] = vals.collect { |x| x.to_i }
```

Note how `collect` will iterate over all the strings in `vals`, converting each to an integer via `to_i`, and then creating a new array of the converted data. We simply assign that new array into our board at the correct row.

### Step 2.3

Save your `sudoku.rb` file. Now in `main.rb`, uncomment the following line.

```Ruby
# puzzle.loadFromFile("txt/sudoku-test1.txt")
```

Make sure you are in the root folder of the project. Run `ruby src/main.rb`. Wow, we just read in all the data from the file, tokenized it, created new integer arrays, and assigned complete arrays into a matrix. How simple was that?!!

## 3. Array processing

We are now going to explore array processing in Ruby by writing some auxiliary methods for our solver.

### Step 3.1

We will start by writing a method to see if we can place a given number in a specific column of the board. Define the method `checkCol(col, num)` in the `Sudoku` class in `sudoku.rb`, which we will return `true` if it is safe to place `num` in column numbered `col`. Let's just write the header for now.

```Ruby
def checkCol(col, num)

end
```

In this method we simply want to check all nine values in the specified column to see if `num` already exists. You already have the tools to write a simple *for-loop* to do this. However, we are going to investigate a different looping construct. Ruby is fully object-oriented, so everything is an object, even primitive types like integer. And so it is easy to provide methods that iterate over a range of integers:

```Ruby
5.upto(10) { |i| block of code using i }
```

This statement will iterate the value `i` from five up to and including `10`. Use this construct to create a loop that will iterate the variable `row` from zero to eight, and check to see if the board entry at position `[row][col]` is the given number (the equality operator is `==`). If it is, just return `false`. See the function `printSudokuBoard` for examples of Ruby's *if-statement* syntax. After the loop, just return `true` to indicate that it is safe to place that number in that column.

### Step 3.2

Ruby's array class has many nice features not typically available in other languages. `Array1 + Array2` will concatenate two arrays: `[4, 5, 6] + [7, 8, 9]` will return `[4, 5, 6, 7, 8, 9]`. `Array1 - Array2` will remove `Array2`'s elements from `Array1` (if they appear): `[1, 2, 3, 4, 5] - [2, 4, 6]` will return `[1, 3, 5]`.

This is useful if you are keeping an array of possibilities for constraint checking or for checking safety by determining if a value exists in an array.

For example:

```Ruby
disjointSet = arrayOfNineInts - [5]
if disjointSet.length == 9
  # Safe to add 5 to the row.
else
  # Unsafe to add 5 to the row, since it already existed there.
end
```

Using this strategy, define a method `checkRow(row, num)` in the `Sudoku` class, which we will return `true` if it is safe to place `num` in row numbered `row`. This is easy since our board is stored as an array of rows. You simply access the board array with a single subscript expression (rather than two) that gives you access to an entire row of the board. You then subtract an array with a single element that is our `num` – you do this by putting square brackets around it as in the example above. Note: we could not have used this same strategy to check the safety of a column, unless of course we wanted to extract the desired column data from each row and make a new array – that's a lot of extra overhead.

### Step 3.3

Array indices can also be ranges. `MyArray[start..end]` will return an array with elements from `start` to `end`, including `end`. `MyArray[start...end]`, note the three dots, will return an array with elements from `start` to `end`, not including `end`. The only drawback is that on multidimensional arrays, ranged indices only work on the last index. So, if you have `sudokuBoard` as a 9×9 array and want the central area as an array for safety checking, you would need something like this:

```Ruby
centerBox = @sudokuBoard[3][3..5] + @sudokuBoard[4][3..5] + @sudokuBoard[5][3..5]
```

Let's use this capability in defining a method `checkSubgrid(row, col, num)` in the `Sudoku` class that will return `true` if it is safe to place the number `num` in the 3×3 subgrid containing the position `[row][col]`. We can find the upper left position of the subgrid by using a combination of integer division and multiplication (by the integer 3). Once we know that position, we can use the above strategy of using array sections and array concatenation to create a nine element array representing the elements of a subgrid. We can then either iterate over that array or use set subtraction (as used in Step 3.2 above) to determine if it is safe to place num in the specified subgrid. Please complete your `checkSubgrid` method using the strategy of your choice.

### Step 3.4

Finally let's write a `check(row, col, num)` method in the `Sudoku` class that calls the other three *check* methods and returns the logical *AND* of all the results. Use the `&&` operator. Ruby also has an `and` operator, but you will need to enclose the entire expression in parentheses (the and operator has a much lower precedence than the `&&` operator).

## 4. Recursion

Finally it is time to write our recursive backtracking solver called `solve` in the `Sudoku` class. Our solver will accept two arguments: the row and column position that we want to place a number into. The initial call to the solver will be for position (0, 0). Our solver will return `true` if it is able to find a solution, otherwise it will return `false`.

### Step 4.1

Let's start by writing the header:

```Ruby
def solve(row, col)

end
```

Our strategy will be to try all nine numbers in the given position and then try to place a number in the next position. Our positions will iterate across the columns of a row. When we get to the end of a row, we will start again at the beginning of the next row. We are done if we ever fill all nine rows.

### Step 4.2

Base cases!! Since we are writing a recursive function, the first thing we need to do is to check our base cases. We have several cases to consider. Of course, you should already be intensely familiar with this strategy after already solving this puzzle in C++ and Racket. The first base case is if we are asked to place something in row nine – that means we have completed rows zero through eight – and thus we are done. Just return `true`. The second base case is if we are asked to place something in column nine – past the end of the row. In this case we want to simply make another recursive call to place a number in the first column (zero) of the next row (and return the result). The next base case is if the position we are asked to fill already has a nonzero number. In that case, we make another recursive call for the next position (same row, next column); and return the result. Okay, we've covered three base cases in about six to nine lines of Ruby code depending on whether you use `elsif` (that's the correct spelling) or not.

### Step 4.3

Finally, try to find a number for the given position. We have seen several ways to iterate over the values one through nine. Pick one and start coding. For each number, see if it is safe for the given row, column, and subgrid. If it is not, iterate to the next number. If it is, place it in the board, and make your recursive call for the next position. If the recursive call returns `true` then you are done – just return `true`. Otherwise you need to iterate to the next number. If you try all nine numbers and none work, set your board position back to zero and return `false`.

### Step 4.4

Now back to `main.rb`, add the initial call of your solver after the initial board is printed. Test the result returned so you can either print the solved board or print a "No solution" message.

### Step 4.5

Run your code (i.e., `ruby src/main.rb`) and be amazed. A Sudoku solver written in 60 minutes!!

## 5. Timing

The last missing piece is a way to time your Ruby solver so that we can compare it to our C++, Racket, and Prolog solvers. Look up information on Ruby's `Time` class to figure out what you need to do. You can find information on Ruby's `Time` class via a web search. Please print out timing information to seconds.

## 6. Testing

You can test your code on the other test cases by simply changing the file name to be loaded in `main.rb`. You can also run the test cases that will be tested on Travis by typing `ruby src/sudoku_test.rb`.

## Example output

```
C:\Users\vandercc\hw07-vandercc>ruby src/main.rb

Here is the initial board:

0 4 3 | 0 8 0 | 2 5 0
6 0 0 | 0 0 0 | 0 0 0
0 0 0 | 0 0 1 | 0 9 4
------+-------+------
9 0 0 | 0 0 4 | 0 7 0
0 0 0 | 6 0 8 | 0 0 0
0 1 0 | 2 0 0 | 0 0 3
------+-------+------
8 2 0 | 5 0 0 | 0 0 0
0 0 0 | 0 0 0 | 0 0 5
0 3 4 | 0 9 0 | 7 1 0

Here is the solution:

1 4 3 | 9 8 6 | 2 5 7
6 7 9 | 4 2 5 | 3 8 1
2 8 5 | 7 3 1 | 6 9 4
------+-------+------
9 6 2 | 3 5 4 | 1 7 8
3 5 7 | 6 1 8 | 9 4 2
4 1 8 | 2 7 9 | 5 6 3
------+-------+------
8 2 1 | 5 6 7 | 4 3 9
7 9 6 | 1 4 3 | 8 2 5
5 3 4 | 8 9 2 | 7 1 6

It took 0.054854 secs to solve.
```

## Final notes

* Ensure that your name, VUnetID, email address, and the honor code statement appear in the header comments of files you altered.

* Do not alter any files in the project other than `main.rb` and `sudoku.rb`!

* All files necessary to run your program must reside in the GitHub.com repository.

* For full credit, your program must pass the test build on Travis CI.
