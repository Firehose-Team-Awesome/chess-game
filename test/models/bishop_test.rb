require 'test_helper'

class BishopTest < ActiveSupport::TestCase

	##### TEST VALID_MOVE METHOD ######

  	test "check if move is valid (invalid case, no movement)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		bishop = game.pieces.where(:pos_x => 2).where(:pos_y => 0).first
		move = bishop.valid_move?([2, 0])
		assert_not move	
	end

	test "check if move is valid (invalid case, off board)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		bishop = game.pieces.where(:pos_x => 2).where(:pos_y => 0).first
		move = bishop.valid_move?([3, -1])
		assert_not move	
	end

	test "check if move is valid (valid case, forward diagonal move)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		bishop = game.pieces.where(:pos_x => 2).where(:pos_y => 0).first
		move = bishop.valid_move?([5, 3])
		assert move	
	end

	test "check if move is valid (valid case, backward diagonal move)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		bishop = game.pieces.where(:pos_x => 5).where(:pos_y => 7).first
		move = bishop.valid_move?([1, 3])
		assert move	
	end

	test "check if move is valid (invalid case, move horizontally)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		bishop = game.pieces.where(:pos_x => 2).where(:pos_y => 0).first
		move = bishop.valid_move?([6, 0])
		assert_not move	
	end

	test "check if move is valid (invalid case, move vertically)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		bishop = game.pieces.where(:pos_x => 2).where(:pos_y => 0).first
		move = bishop.valid_move?([2, 5])
		assert_not move	
	end

	test "check if move is valid (invalid case, big jump)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		bishop = game.pieces.where(:pos_x => 2).where(:pos_y => 0).first
		move = bishop.valid_move?([5, 6])
		assert_not move	
	end
end