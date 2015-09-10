require 'test_helper'

class PieceTest < ActiveSupport::TestCase

	##### TEST CURRENT_POS METHOD ######
  	test "return current position" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		king = game.pieces.where(:pos_x => 3).where(:pos_y => 0).first
		pos = [3, 0]
		assert_equal pos, king.current_pos	
	end


end
