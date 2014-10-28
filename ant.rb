#!/usr/bin/env ruby

class Ant

	attr_accessor :x, :y

	NORTH = "n"
	SOUTH = "s"
	EAST = "e"
	WEST = "w"

	def initialize(x, y)
		@x = x
		@y = y
		@direction = NORTH 
	end
end