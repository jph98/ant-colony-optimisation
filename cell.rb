#!/usr/bin/env ruby

#!/usr/bin/env ruby

require "colorize"

class Cell

	attr_accessor :x, :y, :state

	def initialize(x, y)
		@x = x
		@y = y
		@state = "E"
	end

	def state()

		return @state.colorize(:light_green)
	end

	def to_s
		return "[#{@x},#{@y}] - #{@state}"
	end
end