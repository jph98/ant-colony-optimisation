#!/usr/bin/env ruby

#!/usr/bin/env ruby

require "colorize"

class Cell

	attr_accessor :x, :y, :state

	STATE = "E"

	def initialize(x, y)
		@x = x
		@y = y
	end

	def state()

		return STATE.colorize(:light_green)
	end

	def to_s
		return "[#{@x},#{@y}] - #{@state}"
	end
end