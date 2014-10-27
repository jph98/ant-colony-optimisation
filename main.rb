#!/usr/bin/env ruby

require_relative "world"
require_relative "ant"

w = World.new(40, 20)

ants = []
(1..5).each do |n|
	ants << Ant.new()
end
w.place_ants(ants)

n = 1
while true
	system "clear"
	puts w.display()
	w.simulate(n)
	n += 1
end