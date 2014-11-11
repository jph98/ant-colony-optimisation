#!/usr/bin/env ruby

require_relative "world"
require_relative "ant"

interval = 0.5

w = World.new(10, 10, interval)
w.create_food(5)
w.create_ants(1)

n = 1
while true
	system "clear"
	puts w.display()
	w.simulate(n)
	n += 1
end