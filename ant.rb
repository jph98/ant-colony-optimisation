#!/usr/bin/env ruby

class Ant

	attr_accessor :x, :y, :mode, :state, :direction

	RANDOM_MOVEMENT = :random
	PHEROMONE_MODE = :pher
	LOOK_AROUND = :look

	DEBUG = false

	STATE = "A"

	DIRECTIONS = [:N, :NE, :E, :SE, :S, :SW, :W, :NW]

	def initialize(x, y, random_direction_change)

		@x = x
		@y = y
		@food_collected = 0
		@random_direction_change = random_direction_change
		@direction = get_random_direction_without([]) 
		puts "Generated: #{@direction} for #{@x} and #{@y}" if DEBUG
		@mode = RANDOM_MOVEMENT
		@carrying_food = false
	end

	def collect_food()
		@food_collected += 1
	end

	def get_coords(max_x, max_y)

		if @mode.eql? RANDOM_MOVEMENT

			# Implement lookaround
			puts "Max x: #{max_x}, max y: #{max_y}" if DEBUG
			assign_direction(max_x, max_y)

			puts "before: direction: #{@direction} coords: #{@x} #{@y}" if DEBUG

			@y -= 1 if @direction.eql? :N
			@y -= 1 and @x += 1 if @direction.eql? :NE
			@x += 1 if @direction.eql? :E
			@y += 1 and @x += 1 if @direction.eql? :SE
			@y += 1 if @direction.eql? :S
			@y += 1 and @x -= 1 if @direction.eql? :SW
			@x -= 1 if @direction.eql? :W
			@y -= 1 and @x -= 1 if @direction.eql? :NW

			puts "after: direction: #{@direction} #{@x} #{@y}" if DEBUG
			return @x, @y

		elsif @mode.eql? PHEROMONE_MODE
			# TODO
		end
	end

	def direction_unchanged(new_direction)

		return true if new_direction == nil
	end

	def assign_direction(max_x, max_y)

		invalid_directions = []
		invalid_directions << :N if @y.eql? 0
		invalid_directions << :NE if @y.eql? 0 or @x.eql? max_x
		invalid_directions << :NW if @y.eql? 0 or @x.eql? 0
		invalid_directions << :E if @x.eql? max_x
		invalid_directions << :S if @y.eql? max_y
		invalid_directions << :SE if @y.eql? max_y or @x.eql? max_x
		invalid_directions << :SW if @y.eql? max_y or @x.eql? 0
		invalid_directions << :W if @x.eql? 0

		# Only assign a random direction if the current one is invalid
		if invalid_directions.include? @direction or @random_direction_change.eql? true
			sleep 3 if DEBUG
			puts "Assign random: #{@direction}: #{@x} #{@y} within bounds #{max_x} #{max_y}" if DEBUG
			@direction = get_random_direction_without(invalid_directions)
			puts "Assigned random: #{@direction}" if DEBUG
		end
	end

	def get_random_direction_without(ommitted_directions)

		valid_directions = DIRECTIONS - ommitted_directions
		puts "Valid directions: #{valid_directions}" if DEBUG
		return random_direction(valid_directions)
	end

	def random_direction(valid_directions)

		num = rand(0..(valid_directions.length - 1))
		puts "Num is: #{num}" if DEBUG
		dir = valid_directions[num]
		puts "New dir: #{dir}" if DEBUG
		return dir
	end

	def is_carrying_food?
		if @food_collected.eql? 0 
			return false
		else
			return true
		end
	end

	def state()
		return STATE.colorize(:light_green)
	end

	def to_s
		return "[Ant: x:#{x}, y:#{y} food: #{@food_collected}]"
	end
end