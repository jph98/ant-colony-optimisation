#!/usr/bin/env ruby

gem "minitest"

require "minitest/autorun"
require 'minitest/pride'
require_relative "ant"

class TestAnt < Minitest::Test

	def setup

        @max_x = 5
        @max_y = 5
        @ant = Ant.new(2, 2)
    end  

    # Basic directions
    def test_north
    
        @ant.direction = :N
        x, y = @ant.get_coords(@max_x, @max_y)
        assert_equal 2, x
        assert_equal 1, y
    end

    def test_north_east
    
        @ant.direction = :NE
        x, y = @ant.get_coords(@max_x, @max_y)
        assert_equal 3, x
        assert_equal 1, y
    end

    def test_east
    
        @ant.direction = :E
        x, y = @ant.get_coords(@max_x, @max_y)
        assert_equal 3, x
        assert_equal 2, y
    end

    def test_south_east
    
        @ant.direction = :SE
        x, y = @ant.get_coords(@max_x, @max_y)
        assert_equal 3, x
        assert_equal 3, y
    end

    def test_south
    
        @ant.direction = :S
        x, y = @ant.get_coords(@max_x, @max_y)
        assert_equal 2, x
        assert_equal 3, y
    end

    def test_south_west
    
        @ant.direction = :SW
        x, y = @ant.get_coords(@max_x, @max_y)
        assert_equal 1, x
        assert_equal 3, y
    end
 
    def test_west
    
        @ant.direction = :W
        x, y = @ant.get_coords(@max_x, @max_y)
        assert_equal 1, x
        assert_equal 2, y
    end

    def test_north_west
    
        @ant.direction = :NW
        x, y = @ant.get_coords(@max_x, @max_y)
        assert_equal 1, x
        assert_equal 1, y
    end

    def test_north_boundary
        boundary(0, 0, :N)
    end

    def test_northeast_boundary
        boundary(5, 0, :NE)
    end

    def test_east_boundary
        boundary(5, 0, :E)
    end

    def test_southeast_boundary
        boundary(5, 5, :SE)
    end

    def test_south_boundary
        boundary(0, 5, :S)
    end

    def test_southwest_boundary
        boundary(0, 5, :SW)
    end

    def test_west_boundary
        boundary(0, 5, :W)
    end

    def test_northwest_boundary
        boundary(0, 0, :NW)
    end

    def boundary(x, y, initial)
   
        @ant = Ant.new(x, y)
        @ant.direction = initial
        @ant.get_coords(@max_x, @max_y)
        puts "Current: #{@ant.direction} initial #{initial}"
        assert @ant.direction != initial, "Direction still same"
    end
end