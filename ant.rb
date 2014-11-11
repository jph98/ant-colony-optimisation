#!/usr/bin/env ruby

class Ant

	attr_accessor :x, :y, :mode, :state

	RANDOM_MOVEMENT = :random
	PHEROMONE_MODE = :pher

	#DIRECTIONS = [:N, :NE, :E, :SE, :S, :SW, :W, :NW]
	DIRECTIONS = [:N, :E, :S, :W]	

	def initialize(x, y)

		@x = x
		@y = y
		@direction = get_random_direction_without([]) 
		puts "Generated: #{@direction} for #{@x} and #{@y}"
		@mode = RANDOM_MOVEMENT
		@state = "A"
		@carrying_food = false
	end

	def set_direction(direction)
		@direction = direction
	end

	def get_coords(max_x, max_y)

		assign_direction(max_x, max_y)

		puts "before: direction: dir: #{@direction} coords: #{@x} #{@y}"

		@y -= 1 if @direction.eql? :N
		@y -= 1 and @x += 1 if @direction.eql? :NE
		@x += 1 if @direction.eql? :E
		@y += 1 and @x += 1 if @direction.eql? :SE
		@y += 1 if @direction.eql? :S
		@y += 1 and @x -= 1 if @direction.eql? :SW
		@x -= 1 if @direction.eql? :W
		@y -= 1 and @x -= 1 if @direction.eql? :NW

		puts "after: direction: #{@direction} #{@x} #{@y}"
		return @x, @y
	end

	def direction_unchanged(new_direction)

		return true if new_direction == nil
	end

	def assign_direction(max_x, max_y)

		invalid_directions = []
		invalid_directions << :N if @y.eql? 0
		invalid_directions << :E if @x.eql? max_x
		invalid_directions << :S if @y.eql? max_y
		invalid_directions << :W if @x.eql? 0

		# Only assign a random direction if the current one is invalid
		if invalid_directions.include? @direction
			puts "Assign random: #{@direction}: #{@x} #{@y} #{max_x} #{max_y}"
			@direction = get_random_direction_without(invalid_directions)
			puts "Assigned random: #{@direction}"
		end
	end

	def get_random_direction_without(ommitted_directions)

		valid_directions = DIRECTIONS - ommitted_directions
		puts "Valid directions: #{valid_directions}"
		return random_direction(valid_directions)
	end

	def random_direction(valid_directions)

		num = rand(0..(valid_directions.length - 1))
		puts "Num is: #{num}"
		dir = valid_directions[num]
		puts "New dir: #{dir}"
		return dir
	end

	def is_carrying_food?
		return @is_carrying_food
	end

	def state()
		return @state.colorize(:light_green)
	end

	def to_s
		return "Ant: #{x}, #{y}"
	end
end