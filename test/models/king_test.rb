require 'test_helper'

class KingTest < ActiveSupport::TestCase

	##### TEST VALID_MOVE METHOD ######

  	test "check if move is valid (invalid case, no movement)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		king = game.pieces.where(:pos_x => 3).where(:pos_y => 0).first
		move = king.valid_move?([3, 0])
		assert_not move	
	end

	test "check if move is valid (invalid case, off board)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		king = game.pieces.where(:pos_x => 3).where(:pos_y => 0).first
		move = king.valid_move?([3, -1])
		assert_not move	
	end

	test "check if move is valid (invalid case, move is > 1 step)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		king = game.pieces.where(:pos_x => 3).where(:pos_y => 0).first
		move = king.valid_move?([5, 2])
		assert_not move	
	end

	test "check if move is valid (valid case, move in x dir only)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		king = game.pieces.where(:pos_x => 3).where(:pos_y => 0).first
		move = king.valid_move?([4, 0])
		assert move	
	end

	test "check if move is valid (valid case, move in y dir only)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		king = game.pieces.where(:pos_x => 3).where(:pos_y => 0).first
		move = king.valid_move?([3, 1])
		assert move	
	end

	test "check if move is valid (valid case, move in both dirs)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		king = game.pieces.where(:pos_x => 3).where(:pos_y => 0).first
		move = king.valid_move?([2, 1])
		assert move	
	end


end