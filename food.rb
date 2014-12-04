#!/usr/bin/env ruby

class Food

	attr_accessor :x, :y, :state

	STATE = "F"

	def initialize(x, y)
		@x = x
		@y = y
	end

	def state()
		return STATE.colorize(:light_red)
	end
end