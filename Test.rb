require_relative "Maze"
class Test
	maze = Maze.new(4, 4)
	maze.load "111111111100010001111010101100010101101110101100000101111011101100000101111111111"
	maze.display
	maze.make_graph
	solvable = maze.solve(1, 1, 3, 1)
	puts solvable.solve
end