class Maze
	attr_accessor :maze
	#constructs an m by n maze (matrix)
	# n across and m down
	def initialize n, m
		@maze = Array.new(n, Array.new(m))
	end
	#returns the size of the maze
	def size
		return @maze.length * @maze[0].length
	end

end