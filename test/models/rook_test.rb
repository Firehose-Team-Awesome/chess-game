require 'test_helper'

class RookTest < ActiveSupport::TestCase	
	##### TEST VALID_MOVE METHOD ######

  test "check if move is valid (invalid case, no movement)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		rook = game.pieces.where(:pos_x => 0).where(:pos_y => 0).first
		move = rook.valid_move?([0, 0])
		assert_not move	
	end

	test "check if move is valid (invalid case, off board)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		rook = game.pieces.where(:pos_x => 0).where(:pos_y => 0).first
		move = rook.valid_move?([3, -1])
		assert_not move	
	end

	test "check if move is valid (valid case, horizontal move)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		rook = game.pieces.where(:pos_x => 0).where(:pos_y => 0).first
		move = rook.valid_move?([5, 0])
		assert move	
	end

	test "check if move is valid (valid case, vertical move)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		rook = game.pieces.where(:pos_x => 0).where(:pos_y => 0).first
		move = rook.valid_move?([0, 5])
		assert move	
	end

	test "check if move is valid (invalid case, diagonal move)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		rook = game.pieces.where(:pos_x => 0).where(:pos_y => 0).first
		move = rook.valid_move?([1, 1])
		assert_not move	
	end

	test "check if move is valid (invalid case, big jump move)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		rook = game.pieces.where(:pos_x => 0).where(:pos_y => 0).first
		move = rook.valid_move?([3, 6])
		assert_not move	
	end
end