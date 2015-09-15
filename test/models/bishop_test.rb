require 'test_helper'

class BishopTest < ActiveSupport::TestCase

	##### TEST VALID_MOVE METHOD ######
	#---> to reset the database --> rake db:test:prepare

  test "check if move is valid (invalid case, no movement)" do
		bishop = Bishop.create(:pos_x => 2, :pos_y => 0)
		move = bishop.valid_move?([2, 0])
		assert_not move	
	end

	test "check if move is valid (invalid case, off board)" do
		bishop = Bishop.create(:pos_x => 2, :pos_y => 0)
		move = bishop.valid_move?([3, -1])
		assert_not move	
	end

	test "check if move is valid (valid case, quadrant 1 diagonal move)" do
		bishop = Bishop.create(:pos_x => 2, :pos_y => 0)
		move = bishop.valid_move?([6, 4])
		assert move	
	end

	test "check if move is valid (valid case, quadrant 2 diagonal move)" do
		bishop = Bishop.create(:pos_x => 0, :pos_y => 6)
		move = bishop.valid_move?([5, 1])
		assert move	
	end

	test "check if move is valid (valid case, quadrant 3 diagonal move)" do
		bishop = Bishop.create(:pos_x => 6, :pos_y => 7)
		move = bishop.valid_move?([1, 2])
		assert move	
	end

	test "check if move is valid (valid case, quadrant 4 diagonal move)" do
		bishop = Bishop.create(:pos_x => 6, :pos_y => 0)
		move = bishop.valid_move?([1, 5])
		assert move	
	end

	test "check if move is valid (invalid case, move horizontally)" do
		bishop = Bishop.create(:pos_x => 2, :pos_y => 0)
		move = bishop.valid_move?([6, 0])
		assert_not move	
	end

	test "check if move is valid (invalid case, move vertically)" do
		bishop = Bishop.create(:pos_x => 2, :pos_y => 0)
		move = bishop.valid_move?([2, 5])
		assert_not move	
	end

	test "check if move is valid (invalid case, big jump)" do
		bishop = Bishop.create(:pos_x => 2, :pos_y => 0)
		move = bishop.valid_move?([5, 6])
		assert_not move	
	end
end