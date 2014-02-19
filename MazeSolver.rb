#Jonathan Chu
#Class for solving a maze

require 'thread'

class MazeSolver
	attr_accessor :graph, :begx, :begy, :endx, :endy, :q
	def initialize begx, begy, endx, endy, graph
		@graph = graph
		@begx = begx
		@begy = begy
		@endx = endx
		@endy = endy
		@q = Queue.new	
		@q << [@begx, @begy]
		@graph.graph[begx][begy].visit	
	end

	def solve
		while q.empty? == false
			v = q.deq
			
			@graph.graph[v[0]][v[1]].edges.each do |x, y|
				if x == endx and y == endy
					return true
				elsif @graph.graph[x][y].visited == false and @graph.graph[x][y].value == "0"
					@graph[x][y].visit
					q.push([x, y])
				end
			end
		end
		return false
	end
end