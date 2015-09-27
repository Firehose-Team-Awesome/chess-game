require 'test_helper'

class PiecesControllerTest < ActionController::TestCase
  test "valid pawn move" do
    g = Game.create(white_uid: 1, black_uid: 2)
    white_pawn1 = g.pieces.find_by(pos_x: 1, pos_y: 1)
    put :update, id: white_pawn1.id, pos_x: 1, pos_y: 3
    assert_response :redirect
  end
end
