#Jonathan Chu
#PA3

require_relative "Graph"


class Maze
	attr_accessor :maze, :height, :width, :drawnmaze, :height2, :width2, :arg, :graph
	#constructs an m by n maze (matrix)
	# n across and m down
	def initialize n, m
		@width = n 
		@height = m 
		@width2 =  @width * 2 + 1
		@height2 = @height * 2 + 1
		@maze = Array.new(@height2, Array.new(@width2))
	end
	#load the values into the maze from a string of ones and zeros
	def load arg
	 	if arg.to_s.length == @height2 * @width2
	 		@arg = arg
	 		@arg = @arg.chars.each_index do |index|
	 			@maze[index / @width2][index % @width2] = @arg[index]
	 		end
	 		print_maze
	 	else
	 		puts "Incorrect input size"
	 	end
	end 
	#prints a diagram of the maze on the console.
	def display
		@drawnmaze = fullmaze
		removewalls
		@drawnmaze.chars.each_index do |index|
			if index % @width2 == 0 and index !=0
				
				print "\n" + @drawnmaze[index]
			else
				print @drawnmaze[index]
			end
		end
		puts "\n"
	end
	#prints the 1's and 0's in the maze matrix
	def print_maze
		@maze.each do |x|
			x.each do |y|
				puts y
			end
		end
	end
	#returns a full maze
	def fullmaze
		topbottom = "+-" * @width + "+"
		middle = "|" + " |" * @width
		return topbottom + (middle + topbottom) * @height
	end
	#removes walls where there are 0's in the arg string
	def removewalls 
		@drawnmaze.chars.each_index do |index|
			if @arg[index] == "0" 
				@drawnmaze[index] = " "
			end
		end
	end
	#determines if there’s a way to walk from a specified 
	#beginning position to a specified ending position.
	def solve begx, begy, endx, endy
		make_graph
		@graph.graph[begx][begy].edges.each do |xe, ye|
			if endx == xe and endy = ye
				return true
			end
			if solve(xe, ye, endx, endy) == true
				return true
			end
		end
		return false
	end
	#intializes a graph of the maze
	def make_graph

		@graph = Graph.new(@width2, @height2, @maze)
	end
end