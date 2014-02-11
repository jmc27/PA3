#Jonathan Chu
#PA3

require_relative "Vertex"


class Maze
	attr_accessor :maze, :height, :width, :drawnmaze, :height2, :width2, :arg
	#constructs an m by n maze (matrix)
	# n across and m down
	def initialize n, m
		@width = n 
		@height = m 
		@width2 =  @width * 2 + 1
		@height2 = @height * 2 + 1
		@maze = Array.new(@height2, Array.new(@width2))
	end
	def load arg
	 	if arg.to_s.length == @height2 * @width2
	 		@arg = arg
	 		@arg = @arg.chars.each_index do |index|
	 			@maze[index / @width2][index % @width2] = @arg[index]
	 		end
	 	else
	 		puts "Incorrect input size"
	 	end
	end 

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

	
end