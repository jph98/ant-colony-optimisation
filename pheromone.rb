#!/usr/bin/env ruby

class Pheromone

	attr_accessor :x, :y, :state

	def initialize(x, y)
		@x = x
		@y = y
		@state = "P"
	end

	def state()
		return @state.colorize(:light_blue)
	end
end