#!/usr/bin/env ruby

#!/usr/bin/env ruby

require "colorize"

class Cell

	attr_accessor :x, :y, :state

	EMPTY = "E"
	FOOD = "F"
	PHEROMONE = "P"

	def initialize(x, y, state)
		@x = x
		@y = y
		@state = state
	end

	def state()

		if @state.eql? EMPTY
			return @state.colorize(:light_green)
		elsif @state.eql? FOOD
			return @state.colorize(:light_red)
		elsif @state.eql? PHEROMONE
			return @state.colorize(:light_blue)
		end
	end

	def to_s
		return "[#{@x},#{@y}] - #{@state}"
	end
end