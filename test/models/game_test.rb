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
		rook = game.pieces.where(:pos_x => 0).where(:pos_y => 0).first
		assert_equal "Rook", rook.type.to_s
		assert_equal 0, rook.color
	end

	test "populate black rook - 2 of 2" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		rook = game.pieces.where(:pos_x => 7).where(:pos_y => 0).first
		assert_equal "Rook", rook.type.to_s
		assert_equal 0, rook.color
	end


  ##### TEST POPULATE 2 BLACK KNIGHTS ######

	test "populate black knight - 1 of 2" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		knight = game.pieces.where(:pos_x => 1).where(:pos_y => 0).first
		assert_equal "Knight", knight.type.to_s
		assert_equal 0, knight.color
	end

	test "populate black knight - 2 of 2" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		knight = game.pieces.where(:pos_x => 6).where(:pos_y => 0).first
		assert_equal "Knight", knight.type.to_s
		assert_equal 0, knight.color
	end


  ##### TEST POPULATE 2 BLACK BISHOPS ######

	test "populate black bishop - 1 of 2" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		bishop = game.pieces.where(:pos_x => 2).where(:pos_y => 0).first
		assert_equal "Bishop", bishop.type.to_s
		assert_equal 0, bishop.color
	end

	test "populate black bishop - 2 of 2" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		bishop = game.pieces.where(:pos_x => 5).where(:pos_y => 0).first
		assert_equal "Bishop", bishop.type.to_s
		assert_equal 0, bishop.color
	end


  ##### TEST POPULATE 1 BLACK QUEEN ######

	test "populate black queen - 1 of 1" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		queen = game.pieces.where(:pos_x => 4).where(:pos_y => 0).first
		assert_equal "Queen", queen.type.to_s
		assert_equal 0, queen.color
	end


  ##### TEST POPULATE 1 BLACK KING ######

	test "populate black king 1 of 1" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		king = game.pieces.where(:pos_x => 3).where(:pos_y => 0).first
		assert_equal "King", king.type.to_s
		assert_equal 0, king.color
	end


  ##### TEST POPULATE 8 BLACK PAWNS ######

	test "populate black pawn - 1 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		pawn = game.pieces.where(:pos_x => 0).where(:pos_y => 1).first
		assert_equal "Pawn", pawn.type.to_s
		assert_equal 0, pawn.color
	end

	test "populate black pawn - 2 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		pawn = game.pieces.where(:pos_x => 1).where(:pos_y => 1).first
		assert_equal "Pawn", pawn.type.to_s
		assert_equal 0, pawn.color
	end

	test "populate black pawn - 3 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		pawn = game.pieces.where(:pos_x => 2).where(:pos_y => 1).first
		assert_equal "Pawn", pawn.type.to_s
		assert_equal 0, pawn.color
	end

	test "populate black pawn - 4 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		pawn = game.pieces.where(:pos_x => 3).where(:pos_y => 1).first
		assert_equal "Pawn", pawn.type.to_s
		assert_equal 0, pawn.color
	end

	test "populate black pawn - 5 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		pawn = game.pieces.where(:pos_x => 4).where(:pos_y => 1).first
		assert_equal "Pawn", pawn.type.to_s
		assert_equal 0, pawn.color
	end

	test "populate black pawn - 6 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		pawn = game.pieces.where(:pos_x => 5).where(:pos_y => 1).first
		assert_equal "Pawn", pawn.type.to_s
		assert_equal 0, pawn.color
	end

	test "populate black pawn - 7 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		pawn = game.pieces.where(:pos_x => 6).where(:pos_y => 1).first
		assert_equal "Pawn", pawn.type.to_s
		assert_equal 0, pawn.color
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
		rook = game.pieces.where(:pos_x => 0).where(:pos_y => 7).first
		assert_equal "Rook", rook.type.to_s
		assert_equal 1, rook.color
	end

	test "populate white rook - 2 of 2" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		rook = game.pieces.where(:pos_x => 7).where(:pos_y => 7).first
		assert_equal "Rook", rook.type.to_s
		assert_equal 1, rook.color
	end


  ##### TEST POPULATE 2 WHITE KNIGHTS ######

	test "populate white knight - 1 of 2" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		knight = game.pieces.where(:pos_x => 1).where(:pos_y => 7).first
		assert_equal "Knight", knight.type.to_s
		assert_equal 1, knight.color
	end

	test "populate white knight - 2 of 2" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		knight = game.pieces.where(:pos_x => 6).where(:pos_y => 7).first
		assert_equal "Knight", knight.type.to_s
		assert_equal 1, knight.color
	end


  ##### TEST POPULATE 2 WHITE BISHOPS ######

	test "populate white bishop - 1 of 2" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		bishop = game.pieces.where(:pos_x => 2).where(:pos_y => 7).first
		assert_equal "Bishop", bishop.type.to_s
		assert_equal 1, bishop.color
	end

	test "populate white bishop - 2 of 2" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		bishop = game.pieces.where(:pos_x => 5).where(:pos_y => 7).first
		assert_equal "Bishop", bishop.type.to_s
		assert_equal 1, bishop.color
	end


  ##### TEST POPULATE 1 WHITE QUEEN ######

	test "populate white queen - 1 of 1" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		queen = game.pieces.where(:pos_x => 4).where(:pos_y => 7).first
		assert_equal "Queen", queen.type.to_s
		assert_equal 1, queen.color
	end


  ##### TEST POPULATE 1 WHITE KING ######

	test "populate white king 1 of 1" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		king = game.pieces.where(:pos_x => 3).where(:pos_y => 7).first
		assert_equal "King", king.type.to_s
		assert_equal 1, king.color
	end


  ##### TEST POPULATE 8 WHITE PAWNS ######

	test "populate white pawn - 1 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		pawn = game.pieces.where(:pos_x => 0).where(:pos_y => 6).first
		assert_equal "Pawn", pawn.type.to_s
		assert_equal 1, pawn.color
	end

	test "populate white pawn - 2 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		pawn = game.pieces.where(:pos_x => 1).where(:pos_y => 6).first
		assert_equal "Pawn", pawn.type.to_s
		assert_equal 1, pawn.color
	end

	test "populate white pawn - 3 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		pawn = game.pieces.where(:pos_x => 2).where(:pos_y => 6).first
		assert_equal "Pawn", pawn.type.to_s
		assert_equal 1, pawn.color
	end

	test "populate white pawn - 4 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		pawn = game.pieces.where(:pos_x => 3).where(:pos_y => 6).first
		assert_equal "Pawn", pawn.type.to_s
		assert_equal 1, pawn.color
	end

	test "populate white pawn - 5 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		pawn = game.pieces.where(:pos_x => 4).where(:pos_y => 6).first
		assert_equal "Pawn", pawn.type.to_s
		assert_equal 1, pawn.color
	end

	test "populate white pawn - 6 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		pawn = game.pieces.where(:pos_x => 5).where(:pos_y => 6).first
		assert_equal "Pawn", pawn.type.to_s
		assert_equal 1, pawn.color
	end

	test "populate white pawn - 7 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		pawn = game.pieces.where(:pos_x => 6).where(:pos_y => 6).first
		assert_equal "Pawn", pawn.type.to_s
		assert_equal 1, pawn.color
	end

	test "populate white pawn - 8 of 8" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		pawn = game.pieces.where(:pos_x => 7).where(:pos_y => 6).first
		assert_equal "Pawn", pawn.type.to_s
		assert_equal 1, pawn.color
	end	

	# << COLOR IN CHECK >>
	test "white in check" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		temp_fix_pawn_no_validmove = game.pieces.find_by(:type => 'Pawn')
		temp_fix_pawn_no_validmove.update(:active => false)
		white_king = game.pieces.find_by(:type => 'King', :color => 1)
    white_king.update(:pos_x => 0, :pos_y => 3)
    rook = game.pieces.find_by(:pos_x => 0, :pos_y => 0, :color => 0)
    rook.update(:pos_x => 0, :pos_y => 2)
    assert game.is_color_in_check?(white_king.color)
	end
end
