#Jonathan Chu
#This class is a graph of vertices

require_relative "Vertex"
class Graph
	attr_accessor :graph, :height, :width, :maze
	def initialize n, m, maze
		@height = m
		@width = n
		@maze = maze
		initialize_graph
	end
	#insert vertices into array
	def initialize_graph
		@graph = Array.new(@height, Array.new(@width))
		@graph.each_with_index do |x, xi|
			x.each_with_index do |y, yi|
				@graph[xi][yi] = Vertex.new(xi, yi, @maze[xi][yi])
			end
		end
		find_edges

	end
	#find and insert the edges of the vertex
	def find_edges
		@graph.each_index do |xi|
			@graph.each_index do |yi|
				check_adjacent(xi, yi)
			end
		end
	end
	#checks adjacent verticies on the maze
	def check_adjacent x, y
		if @maze[x][y] != "1"
			if x - 1 > 0 and @maze[x - 1][y] == "0"

				@graph[x][y].make_edge(x - 1, y)
			end
			if y - 1 > 0 and @maze[x][y - 1] == "0"

				@graph[x][y].make_edge(x, y - 1)
			end
			if x + 1 < @height and @maze[x + 1][y] == "0"

				@graph[x][y].make_edge(x + 1, y)
			end
			if y + 1 < @width and @maze[x][y + 1] == "0"

				@graph[x][y].make_edge(x, y + 1)
			end
		end
	end
end