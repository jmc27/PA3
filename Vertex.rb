class Vertex
	attr_accessor :x, :y, :value, :paths, :visited, :prev, :next, :edges
	def initialize x, y, value
		@x = x
		@y = y
		@edges = []
		@visited = false
		@value = value
	end
	#resets the state of the vertex
	def clear
		@edges = []
		@visited = false
		@prev = nil
		@next = nil
	end
	def make_edge x, y
		@edges.push([x, y])
		puts @edges + "l"
	end
end