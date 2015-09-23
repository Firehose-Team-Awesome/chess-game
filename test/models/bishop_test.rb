require 'test_helper'

class BishopTest < ActiveSupport::TestCase

	##### TEST VALID_MOVE METHOD ######
	#---> to reset the database --> rake db:test:prepare

  test "check if move is valid (invalid case, no movement)" do
  	game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		bishop = game.pieces.where(:pos_x => 2).where(:pos_y => 0).first
		move = bishop.valid_move?([2, 0])
		assert_not move	
	end

	test "check if move is valid (invalid case, off board)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		bishop = game.pieces.where(:pos_x => 2).where(:pos_y => 0).first
		move = bishop.valid_move?([2, -1])
		assert_not move	
	end

	test "check if move is valid (invalid case, obstruction)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		bishop = game.pieces.where(:pos_x => 2).where(:pos_y => 0).first
		move = bishop.valid_move?([4, 2])
		assert_not move	
	end

	test "check if move is valid (valid case, quadrant 1 diagonal move)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		bishop = Bishop.create(:pos_x => 0, :pos_y => 2, :game_id => game.id)
		move = bishop.valid_move?([2, 4])
		assert move	
	end

	test "check if move is valid (valid case, quadrant 2 diagonal move)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		bishop = Bishop.create(:pos_x => 0, :pos_y => 4, :game_id => game.id)
		move = bishop.valid_move?([2, 2])
		assert move	
	end

	test "check if move is valid (valid case, quadrant 3 diagonal move)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		bishop = Bishop.create(:pos_x => 2, :pos_y => 4, :game_id => game.id)
		move = bishop.valid_move?([0, 2])
		assert move	
	end

	test "check if move is valid (valid case, quadrant 4 diagonal move)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		bishop = Bishop.create(:pos_x => 2, :pos_y => 2, :game_id => game.id)
		move = bishop.valid_move?([0, 4])
		assert move	
	end

	test "check if move is valid (invalid case, move horizontally)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		bishop = Bishop.create(:pos_x => 0, :pos_y => 2, :game_id => game.id)
		move = bishop.valid_move?([2, 2])
		assert_not move	
	end

	test "check if move is valid (invalid case, move vertically)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		bishop = Bishop.create(:pos_x => 0, :pos_y => 2, :game_id => game.id)
		move = bishop.valid_move?([0, 4])
		assert_not move	
	end

	test "check if move is valid (invalid case, big jump)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		bishop = Bishop.create(:pos_x => 0, :pos_y => 2, :game_id => game.id)
		move = bishop.valid_move?([4, 5])
		assert_not move	
	end
end