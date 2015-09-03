require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  #####################################################################################################
	################################# POPULATE BLACK PIECES #############################################
	#####################################################################################################


  ##### TEST POPULATE 2 BLACK ROOKS ######

	test "populate black rook - 1 of 2" do
	  game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Rook0"
		rook = game.pieces.where(:pos_x => 0).where(:pos_y => 0).first
		actual = rook.type.to_s + rook.color.to_s
		assert_equal expected, actual
	end

	test "populate black rook - 2 of 2" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Rook0"
		rook = game.pieces.where(:pos_x => 7).where(:pos_y => 0).first
		actual = rook.type.to_s + rook.color.to_s
		assert_equal expected, actual
	end


  ##### TEST POPULATE 2 BLACK KNIGHTS ######

	test "populate black knight - 1 of 2" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Knight0"
		knight = game.pieces.where(:pos_x => 1).where(:pos_y => 0).first
		actual = knight.type.to_s + knight.color.to_s
		assert_equal expected, actual
	end

	test "populate black knight - 2 of 2" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Knight0"
		knight = game.pieces.where(:pos_x => 6).where(:pos_y => 0).first
		actual = knight.type.to_s + knight.color.to_s
		assert_equal expected, actual
	end


  ##### TEST POPULATE 2 BLACK BISHOPS ######

	test "populate black bishop - 1 of 2" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Bishop0"
		bishop = game.pieces.where(:pos_x => 2).where(:pos_y => 0).first
		actual = bishop.type.to_s + bishop.color.to_s
		assert_equal expected, actual
	end

	test "populate black bishop - 2 of 2" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Bishop0"
		bishop = game.pieces.where(:pos_x => 5).where(:pos_y => 0).first
		actual = bishop.type.to_s + bishop.color.to_s
		assert_equal expected, actual
	end


  ##### TEST POPULATE 1 BLACK QUEEN ######

	test "populate black queen - 1 of 1" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Queen0"
		queen = game.pieces.where(:pos_x => 4).where(:pos_y => 0).first
		actual = queen.type.to_s + queen.color.to_s
		assert_equal expected, actual
	end


  ##### TEST POPULATE 1 BLACK KING ######

	test "populate black king 1 of 1" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "King0"
		king = game.pieces.where(:pos_x => 3).where(:pos_y => 0).first
		actual = king.type.to_s + king.color.to_s
		assert_equal expected, actual
	end


  ##### TEST POPULATE 8 BLACK PAWNS ######

	test "populate black pawn - 1 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Pawn0"
		pawn = game.pieces.where(:pos_x => 0).where(:pos_y => 1).first
		actual = pawn.type.to_s + pawn.color.to_s
		assert_equal expected, actual
	end

	test "populate black pawn - 2 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Pawn0"
		pawn = game.pieces.where(:pos_x => 1).where(:pos_y => 1).first
		actual = pawn.type.to_s + pawn.color.to_s
		assert_equal expected, actual
	end

	test "populate black pawn - 3 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Pawn0"
		pawn = game.pieces.where(:pos_x => 2).where(:pos_y => 1).first
		actual = pawn.type.to_s + pawn.color.to_s
		assert_equal expected, actual
	end

	test "populate black pawn - 4 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Pawn0"
		pawn = game.pieces.where(:pos_x => 3).where(:pos_y => 1).first
		actual = pawn.type.to_s + pawn.color.to_s
		assert_equal expected, actual
	end

	test "populate black pawn - 5 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Pawn0"
		pawn = game.pieces.where(:pos_x => 4).where(:pos_y => 1).first
		actual = pawn.type.to_s + pawn.color.to_s
		assert_equal expected, actual
	end

	test "populate black pawn - 6 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Pawn0"
		pawn = game.pieces.where(:pos_x => 5).where(:pos_y => 1).first
		actual = pawn.type.to_s + pawn.color.to_s
		assert_equal expected, actual
	end

	test "populate black pawn - 7 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Pawn0"
		pawn = game.pieces.where(:pos_x => 6).where(:pos_y => 1).first
		actual = pawn.type.to_s + pawn.color.to_s
		assert_equal expected, actual
	end

	test "populate black pawn - 8 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Pawn0"
		pawn = game.pieces.where(:pos_x => 7).where(:pos_y => 1).first
		actual = pawn.type.to_s + pawn.color.to_s
		assert_equal expected, actual
	end	


	#####################################################################################################
	################################# POPULATE WHITE PIECES #############################################
	#####################################################################################################


  ##### TEST POPULATE 2 WHITE ROOKS ######

	test "populate white rook - 1 of 2" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Rook1"
		rook = game.pieces.where(:pos_x => 0).where(:pos_y => 7).first
		actual = rook.type.to_s + rook.color.to_s
		assert_equal expected, actual
	end

	test "populate white rook - 2 of 2" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Rook1"
		rook = game.pieces.where(:pos_x => 7).where(:pos_y => 7).first
		actual = rook.type.to_s + rook.color.to_s
		assert_equal expected, actual
	end


  ##### TEST POPULATE 2 WHITE KNIGHTS ######

	test "populate white knight - 1 of 2" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Knight1"
		knight = game.pieces.where(:pos_x => 1).where(:pos_y => 7).first
		actual = knight.type.to_s + knight.color.to_s
		assert_equal expected, actual
	end

	test "populate white knight - 2 of 2" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Knight1"
		knight = game.pieces.where(:pos_x => 6).where(:pos_y => 7).first
		actual = knight.type.to_s + knight.color.to_s
		assert_equal expected, actual
	end


  ##### TEST POPULATE 2 WHITE BISHOPS ######

	test "populate white bishop - 1 of 2" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Bishop1"
		bishop = game.pieces.where(:pos_x => 2).where(:pos_y => 7).first
		actual = bishop.type.to_s + bishop.color.to_s
		assert_equal expected, actual
	end

	test "populate white bishop - 2 of 2" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Bishop1"
		bishop = game.pieces.where(:pos_x => 5).where(:pos_y => 7).first
		actual = bishop.type.to_s + bishop.color.to_s
		assert_equal expected, actual
	end


  ##### TEST POPULATE 1 WHITE QUEEN ######

	test "populate white queen - 1 of 1" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Queen1"
		queen = game.pieces.where(:pos_x => 3).where(:pos_y => 7).first
		actual = queen.type.to_s + queen.color.to_s
		assert_equal expected, actual
	end


  ##### TEST POPULATE 1 WHITE KING ######

	test "populate white king 1 of 1" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "King1"
		king = game.pieces.where(:pos_x => 4).where(:pos_y => 7).first
		actual = king.type.to_s + king.color.to_s
		assert_equal expected, actual
	end


  ##### TEST POPULATE 8 WHITE PAWNS ######

	test "populate white pawn - 1 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Pawn1"
		pawn = game.pieces.where(:pos_x => 0).where(:pos_y => 6).first
		actual = pawn.type.to_s + pawn.color.to_s
		assert_equal expected, actual
	end

	test "populate white pawn - 2 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Pawn1"
		pawn = game.pieces.where(:pos_x => 1).where(:pos_y => 6).first
		actual = pawn.type.to_s + pawn.color.to_s
		assert_equal expected, actual
	end

	test "populate white pawn - 3 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Pawn1"
		pawn = game.pieces.where(:pos_x => 2).where(:pos_y => 6).first
		actual = pawn.type.to_s + pawn.color.to_s
		assert_equal expected, actual
	end

	test "populate white pawn - 4 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Pawn1"
		pawn = game.pieces.where(:pos_x => 3).where(:pos_y => 6).first
		actual = pawn.type.to_s + pawn.color.to_s
		assert_equal expected, actual
	end

	test "populate white pawn - 5 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Pawn1"
		pawn = game.pieces.where(:pos_x => 4).where(:pos_y => 6).first
		actual = pawn.type.to_s + pawn.color.to_s
		assert_equal expected, actual
	end

	test "populate white pawn - 6 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Pawn1"
		pawn = game.pieces.where(:pos_x => 5).where(:pos_y => 6).first
		actual = pawn.type.to_s + pawn.color.to_s
		assert_equal expected, actual
	end

	test "populate white pawn - 7 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Pawn1"
		pawn = game.pieces.where(:pos_x => 6).where(:pos_y => 6).first
		actual = pawn.type.to_s + pawn.color.to_s
		assert_equal expected, actual
	end

	test "populate white pawn - 8 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		expected = "Pawn1"
		pawn = game.pieces.where(:pos_x => 7).where(:pos_y => 6).first
		actual = pawn.type.to_s + pawn.color.to_s
		assert_equal expected, actual
	end	


end
