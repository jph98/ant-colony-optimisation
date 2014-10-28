#!/usr/bin/env ruby

require_relative "cell"
require_relative "food"

class World

	INTERVAL = 1

	def initialize(user_width, user_height)

		@max_width_x = user_width - 1
		@max_height_y = user_height - 1

		create_board()

		@ants = []
		@food_pieces = []
	end

	# Create the board
	def create_board()

		# Create a board 
		@rows = Array.new(@max_height_y)
		(0..@max_height_y).each do |y|

			@rows[y] = Array.new(@max_width_x)

			(0..@max_width_x).each do |x|

				cells = @rows[y]
				cells[x] = Cell.new(x, y, Cell::EMPTY)
			end
		end
	end

	# Display the board
	def display()

		text = ""
		@rows.each do |y|
			text += "Row: "
			y.each_with_index do |e, i|
				case e
				when Cell
					text += "#{e.state}"
				when Ant
					text += "A".colorize(:red)
				when Food
					text += "F".colorize(:blue)
				else
					puts "Unknown: '#{e.class}'"
				end
			end
			text += "\n"
		end
		return "#{text}\n" 
	end

	def create_ants(num)

		(0..num).each do |n|

			x = rand(1..@max_width_x)
			y = rand(1..@max_height_y)
			ant = Ant.new(x, y)
			@ants << ant
			@rows[y][x] = ant
		end
	end

	def create_food(num)

		(0..num).each do |n|

			x = rand(1..@max_width_x)
			y = rand(1..@max_height_y)
			food = Food.new(x, y)
			@food_pieces << food
			@rows[y][x] = food
		end
	end

	def simulate(n)

		# TODO: Move Ants, update state
		puts "Generated iteration #{n}"
		sleep INTERVAL
	end
end