#!/usr/bin/env ruby

require_relative "world"
require_relative "ant"

w = World.new(40, 20)
w.create_food(5)
w.create_ants(5)

n = 1
while true
	system "clear"
	puts w.display()
	w.simulate(n)
	n += 1
	exit
end