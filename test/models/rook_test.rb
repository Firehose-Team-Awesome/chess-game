require 'test_helper'

class RookTest < ActiveSupport::TestCase	
	##### TEST VALID_MOVE METHOD ######
	# --> clear test db --> rake db:test:prepare

  test "check if move is valid (invalid case, no movement)" do
  	game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		rook = game.pieces.where(:pos_x => 0, :pos_y => 0)
		move = rook.valid_move?([0, 0])
		assert_not move
	end

	test "check if move is valid (invalid case, off board)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		rook = game.pieces.where(:pos_x => 0, :pos_y => 0)
		move = rook.valid_move?([0, -1])
		assert_not move	
	end

	test "check if move is valid (valid case, left horizontal move)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		rook = Rook.create(:pos_x => 1, :pos_y => 2)
		move = rook.valid_move?([0, 2])
		assert move	
	end

	test "check if move is valid (valid case, right horizontal move)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		rook = Rook.create(:pos_x => 0, :pos_y => 2)
		move = rook.valid_move?([1, 2])
		assert move	
	end

	test "check if move is valid (valid case, up vertical move)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		rook = Rook.create(:pos_x => 0, :pos_y => 2)
		move = rook.valid_move?([0, 3])
		assert move	
	end

	test "check if move is valid (valid case, down vertical move)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		rook = Rook.create(:pos_x => 0, :pos_y => 3)
		move = rook.valid_move?([0, 2])
		assert move	
	end

	test "check if move is valid (invalid case, diagonal move)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		rook = Rook.create(:pos_x => 0, :pos_y => 2)
		move = rook.valid_move?([1, 3])
		assert_not move	
	end

	test "check if move is valid (invalid case, big jump move)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		rook = Rook.create(:pos_x => 0, :pos_y => 2)
		move = rook.valid_move?([3, 4])
		assert_not move	
	end
	
end