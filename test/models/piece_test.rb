require 'test_helper'

class PieceTest < ActiveSupport::TestCase

	##### TEST CURRENT_POS METHOD ######
  	test "return current position" do
		game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
		king = game.pieces.where(:pos_x => 3).where(:pos_y => 0).first
		pos = [3, 0]
		assert_equal pos, king.current_pos	
	end

	  test "obstructed?" do
    g = Game.create(white_uid: 1, black_uid: 2)
    piece1 = g.pieces.find_by(pos_x: 0, pos_y: 0)
    piece2 = g.pieces.find_by(pos_x: 2, pos_y: 0)
    piece3 = g.pieces.find_by(pos_x: 6, pos_y: 7)
    piece4 = g.pieces.find_by(pos_x: 6, pos_y: 6)
    piece5 = g.pieces.create(pos_x: 2, pos_y: 4, type: "Pawn", color: 1)

    assert piece1.is_obstructed?([0,0],[3,0])
    assert piece2.is_obstructed?([2,0],[2,4])
    assert piece2.is_obstructed?([2,0],[0,0])
    assert piece3.is_obstructed?([6,7],[3,4])
    assert piece4.is_obstructed?([6,6],[3,6])
    assert !piece4.is_obstructed?([6,6],[6,4])
    assert !piece5.is_obstructed?([2,4],[6,4])
    assert !piece5.is_obstructed?([2,4],[0,4])
  end


end
