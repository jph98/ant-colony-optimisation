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
    
        @ant.set_direction(:N)
        x, y = @ant.get_coords(@max_x, @max_y)
        assert_equal 2, x
        assert_equal 1, y
    end

    def test_north_east
    
        @ant.set_direction(:NE)
        x, y = @ant.get_coords(@max_x, @max_y)
        assert_equal 3, x
        assert_equal 1, y
    end

    def test_east
    
        @ant.set_direction(:E)
        x, y = @ant.get_coords(@max_x, @max_y)
        assert_equal 3, x
        assert_equal 2, y
    end

    def test_south_east
    
        @ant.set_direction(:SE)
        x, y = @ant.get_coords(@max_x, @max_y)
        assert_equal 3, x
        assert_equal 3, y
    end

    def test_south
    
        @ant.set_direction(:S)
        x, y = @ant.get_coords(@max_x, @max_y)
        assert_equal 2, x
        assert_equal 3, y
    end

    def test_south_west
    
        @ant.set_direction(:SW)
        x, y = @ant.get_coords(@max_x, @max_y)
        assert_equal 1, x
        assert_equal 3, y
    end
 
    def test_west
    
        @ant.set_direction(:W)
        x, y = @ant.get_coords(@max_x, @max_y)
        assert_equal 1, x
        assert_equal 2, y
    end

    def test_north_west
    
        @ant.set_direction(:NW)
        x, y = @ant.get_coords(@max_x, @max_y)
        assert_equal 1, x
        assert_equal 1, y
    end

    # Boundaries
    def test_north_boundary
   
        @ant = Ant.new(2, 0) 
        @ant.set_direction(:N)
        x, y = @ant.get_coords(@max_x, @max_y)
        assert_equal 2, x
        assert_equal 1, y
    end
end