require 'test_helper'

class RookTest < ActiveSupport::TestCase	
	##### TEST VALID_MOVE METHOD ######
	# --> clear test db --> rake db:test:prepare

  test "check if move is valid (invalid case, no movement)" do
		rook = Rook.create(:pos_x => 0, :pos_y => 0)
		move = rook.valid_move?([0, 0])
		assert_not move	
	end

	test "check if move is valid (invalid case, off board)" do
		rook = Rook.create(:pos_x => 0, :pos_y => 0)
		move = rook.valid_move?([3, -1])
		assert_not move	
	end

	test "check if move is valid (valid case, left horizontal move)" do
		rook = Rook.create(:pos_x => 7, :pos_y => 0)
		move = rook.valid_move?([1, 0])
		assert move	
	end

	test "check if move is valid (valid case, right horizontal move)" do
		rook = Rook.create(:pos_x => 0, :pos_y => 0)
		move = rook.valid_move?([5, 0])
		assert move	
	end

	test "check if move is valid (valid case, up vertical move)" do
		rook = Rook.create(:pos_x => 0, :pos_y => 0)
		move = rook.valid_move?([0, 5])
		assert move	
	end

	test "check if move is valid (valid case, down vertical move)" do
		rook = Rook.create(:pos_x => 0, :pos_y => 7)
		move = rook.valid_move?([0, 4])
		assert move	
	end

	test "check if move is valid (invalid case, diagonal move)" do
		rook = Rook.create(:pos_x => 0, :pos_y => 0)
		move = rook.valid_move?([1, 1])
		assert_not move	
	end

	test "check if move is valid (invalid case, big jump move)" do
		rook = Rook.create(:pos_x => 0, :pos_y => 0)
		move = rook.valid_move?([3, 6])
		assert_not move	
	end
	
end