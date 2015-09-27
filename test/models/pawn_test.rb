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

end