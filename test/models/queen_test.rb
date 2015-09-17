require 'test_helper'

class QueenTest < ActiveSupport::TestCase

	##### TEST VALID_MOVE METHOD ######

  	test "check if move is valid (invalid case, no movement)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		queen = game.pieces.where(:pos_x => 4).where(:pos_y => 0).first
		move = queen.valid_move?([4, 0])
		assert_not move	
	end

	test "check if move is valid (invalid case, off board)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		queen = game.pieces.where(:pos_x => 4).where(:pos_y => 0).first
		move = queen.valid_move?([4, -1])
		assert_not move	
	end

	test "check if move is valid (invalid case, obstruction in path)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		queen = game.pieces.where(:pos_x => 4).where(:pos_y => 0).first
		king = game.pieces.where(:pos_x => 4).where(:pos_y => 2).first
		move = queen.valid_move?([4, 3])
		assert_not move	
	end

	test "check if move is valid (invalid case, L-shaped move)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		queen = game.pieces.where(:pos_x => 4).where(:pos_y => 0).first
		move = queen.valid_move?([6, 1])
		assert_not move	
	end

	test "check if move is valid (valid case, move diagonally left)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		queen = game.pieces.where(:pos_x => 4).where(:pos_y => 0).first
		move = queen.valid_move?([3, 1])
		assert move	
	end

	test "check if move is valid (valid case, move diagonally right)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		queen = game.pieces.where(:pos_x => 4).where(:pos_y => 0).first
		move = queen.valid_move?([5, 1])
		assert move	
	end

	test "check if move is valid (valid case, move horizontally)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		queen = game.pieces.where(:pos_x => 4).where(:pos_y => 0).first
		move = queen.valid_move?([5, 0])
		assert move	
	end

	test "check if move is valid (valid case, move vertically)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		queen = game.pieces.where(:pos_x => 4).where(:pos_y => 0).first
		move = queen.valid_move?([4, 1])
		assert move	
	end

end