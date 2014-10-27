#!/usr/bin/env ruby

require_relative "world"
require_relative "ant"

w = World.new(10, 10)
puts w.display()

ants = []
(1..5).each do |n|
	ants << Ant.new()
end