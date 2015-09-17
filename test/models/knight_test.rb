require 'test_helper'

class KnightTest < ActiveSupport::TestCase

	##### TEST VALID_MOVE METHOD ######

  	test "check if move is valid (invalid case, no movement)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		knight = game.pieces.where(:pos_x => 1).where(:pos_y => 0).first
		move = knight.valid_move?([1, 0])
		assert_not move	
	end

	test "check if move is valid (invalid case, off board)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		knight = game.pieces.where(:pos_x => 1).where(:pos_y => 0).first
		move = knight.valid_move?([1, -1])
		assert_not move	
	end

	test "check if move is valid (invalid case, not correct move pattern)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		knight = game.pieces.where(:pos_x => 1).where(:pos_y => 0).first
		move = knight.valid_move?([6, 1])
		assert_not move	
	end

	test "check if move is valid (valid case, move up one, right two)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		knight = game.pieces.where(:pos_x => 1).where(:pos_y => 0).first
		move = knight.valid_move?([3, 1])
		assert move	
	end

	test "check if move is valid (valid case, move up two, left one)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		knight = game.pieces.where(:pos_x => 1).where(:pos_y => 0).first
		move = knight.valid_move?([2, 2])
		assert move	
	end


end