#!/usr/bin/env ruby

class Food

	attr_accessor :x, :y, :state

	def initialize(x, y)
		@x = x
		@y = y
		@state = "F"
	end

	def state()
		return @state.colorize(:light_red)
	end
end