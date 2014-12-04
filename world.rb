#!/usr/bin/env ruby

require_relative "cell"
require_relative "food"

class World

	attr_accessor :interval

	DEBUG = false

	# user_width - width of the board
	# user_height - height of the board
	# interval - interval to wait inbetween making moves
	# ants_random_direction_change - whether Ants should randomly change direction
	def initialize(user_width, user_height, interval, ants_random_direction_change)

		@max_width_x = user_width - 1
		@max_height_y = user_height - 1

		create_board()

		@ants = []
		@food_pieces = []

		@interval = interval

		@ants_random_direction_change = ants_random_direction_change
	end

	# Create the board
	def create_board()

		# Create a board 
		@map = Array.new(@max_height_y)
		(0..@max_height_y).each do |y|

			@map[y] = Array.new(@max_width_x)

			(0..@max_width_x).each do |x|

				cells = @map[y]
				cells[x] = Cell.new(x, y)
			end
		end
	end

	# Display the board
	def display()

		text = ""
		@map.each do |y|
			text += "Row: "
			y.each_with_index do |e, i|
				case e
				when Cell
					text += Cell::STATE.colorize(:light_green)
				when Ant
					text += Ant::STATE.colorize(:red)
				when Food
					text += Food::STATE.colorize(:blue)
				else
					puts "Unknown: '#{e.class}'" if DEBUG
				end
			end
			text += "\n"
		end
		return "#{text}\n" 
	end

	def create_ants(num)

		(1..num).each do |n|

			x = rand(1..@max_width_x)
			y = rand(1..@max_height_y)
			ant = Ant.new(x, y, @ants_random_direction_change)
			@ants << ant
			@map[y][x] = ant
		end
	end

	def create_food(num)

		(1..num).each do |n|

			x = rand(1..@max_width_x)
			y = rand(1..@max_height_y)
			food = Food.new(x, y)
			@food_pieces << food
			@map[y][x] = food
		end
	end

	def move_ant(a)

		# Change the current space to empty
		@map[a.y][a.x] = Cell.new(a.x, a.y)

		# Get new coords
		x, y = a.get_coords(@max_width_x, @max_height_y)

		# Check to see what's there already
		space = @map[a.y][a.x]

		# Handle each cell accordingly
		case space
		when Cell
			# Occupy
			@map[y][x] = a
			return "#{Cell::STATE}"
		when Ant
			#raise "Not Implementation: collision"
			return "#{Ant::STATE}"
		when Food
			# Collect food, start to leave trail
			#raise "Not Implemented: food collection"
			a.collect_food()
			@map[y][x] = a
			return "#{Food::STATE}"
		else
			raise "Moved to an unknown space: '#{space.class}'"
		end
	end

	def simulate(n)

		puts "Generated iteration #{n}"
		text = "Moving ants: "
		@ants.each do |a|
			text += "#{a}"
			new_state = move_ant(a)
			text += " to: #{new_state}\t"
		end
		puts text
		sleep @interval
	end
end