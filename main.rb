#!/usr/bin/env ruby

require_relative "world"
require_relative "ant"

interval = 0.6
ants_random_direction_change = true

w = World.new(20, 20, interval, ants_random_direction_change)
w.create_food(20)
w.create_ants(10)

n = 1
while true
	system "clear"
	puts w.display()
	w.simulate(n)
	n += 1
end