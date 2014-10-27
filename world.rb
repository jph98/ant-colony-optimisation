#!/usr/bin/env ruby

require_relative "cell"

class World

	INTERVAL = 1

	def initialize(user_width, user_height)

		@max_width_x = user_width - 1
		@max_height_y = user_height - 1

		create_board()
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
			y.each_with_index do |c, i|
				text += "#{c.state}"
			end
			text += "\n"
		end
		return "#{text}\n" 
	end

	def place_ants(ants)
		@ants = ants
	end

	def simulate(n)

		# TODO: Move Ants, update state
		puts "Generated iteration #{n}"
		sleep INTERVAL
	end
end