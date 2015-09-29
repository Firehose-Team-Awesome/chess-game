require 'test_helper'

class PawnTest < ActiveSupport::TestCase

	##### TEST EN_PASSANT METHOD ######
	# --> clear test db --> rake db:test:prepare

  	test "update en passant status (true case)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		pawn = game.pieces.where(:pos_x => 4).where(:pos_y => 1).first		
		move = pawn.update_en_passant_status(4, 3)
		assert pawn.en_passant	
	end

	test "update en passant status (false case)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		pawn = game.pieces.where(:pos_x => 4).where(:pos_y => 1).first		
		move = pawn.update_en_passant_status(4, 2)
		assert_not pawn.en_passant	
	end

	test "can capture en passant (true case)" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		pawn_black = game.pieces.where(:pos_x => 4).where(:pos_y => 1).first
		pawn_white = game.pieces.where(:pos_x => 5).where(:pos_y => 6).first			
		pawn_black.update_en_passant_status(4, 3)		
		pawn_white.update_attributes(:pos_x => 5, :pos_y => 3)
		pawn_black.update_attributes(:pos_x => 4, :pos_y => 3)
		can_capture = pawn_white.can_capture_en_passant(pawn_black)
		puts pawn_black.updated_at
		puts game.updated_at
		assert can_capture
	end

end