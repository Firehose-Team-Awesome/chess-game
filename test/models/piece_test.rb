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

  #################################################
  ################# TEST CASTLING #################
  #################################################

  test "check if castle is valid (invalid case, obstructed)" do
    game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
    king = game.pieces.where(:pos_x => 3).where(:pos_y => 0).first
    rook = game.pieces.where(:pos_x => 0).where(:pos_y => 0).first
    castle = rook.can_castle_kingside?(rook, king)
    assert_not castle 
  end

  test "check if castle is valid (invalid case, king moved)" do
    game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
    knight = game.pieces.where(:pos_x => 1).where(:pos_y => 0).first
    knight.delete
    bishop = game.pieces.where(:pos_x => 2).where(:pos_y => 0).first
    bishop.delete
    king = game.pieces.where(:pos_x => 3).where(:pos_y => 0).first
    king.update_attributes(:pos_x => 2)
    rook = game.pieces.where(:pos_x => 0).where(:pos_y => 0).first
    castle = rook.can_castle_kingside?(rook, king)
    assert_not castle
  end

  test "check if castle is valid (valid case, kingside)" do
    game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
    knight = game.pieces.where(:pos_x => 1).where(:pos_y => 0).first
    knight.delete
    bishop = game.pieces.where(:pos_x => 2).where(:pos_y => 0).first
    bishop.delete
    king = game.pieces.where(:pos_x => 3).where(:pos_y => 0).first
    rook = game.pieces.where(:pos_x => 0).where(:pos_y => 0).first
    castle = rook.can_castle_kingside?(rook, king)
    assert castle
  end

  test "check if castle is valid (valid case, queenside)" do
    game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
    knight = game.pieces.where(:pos_x => 6).where(:pos_y => 0).first
    knight.delete
    bishop = game.pieces.where(:pos_x => 5).where(:pos_y => 0).first
    bishop.delete
    queen = game.pieces.where(:pos_x => 4).where(:pos_y => 0).first
    queen.delete
    king = game.pieces.where(:pos_x => 3).where(:pos_y => 0).first
    rook = game.pieces.where(:pos_x => 7).where(:pos_y => 0).first
    castle = rook.can_castle_queenside?(rook, king)
    assert castle
  end

  test "check if kingside castling works in DB" do
    game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
    king = game.pieces.where(:pos_x => 3).where(:pos_y => 0).first
    rook = game.pieces.where(:pos_x => 0).where(:pos_y => 0).first
    castle = rook.castle_kingside!(rook, king)
    new_king_pos_x = 0
    assert new_king_pos_x, king.pos_x
  end

  test "check if queenside castling works in DB" do
    game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
    king = game.pieces.where(:pos_x => 3).where(:pos_y => 0).first
    rook = game.pieces.where(:pos_x => 7).where(:pos_y => 0).first
    castle = rook.castle_queenside!(rook, king)
    new_king_pos_x = 7
    assert new_king_pos_x, king.pos_x
  end

  #################################################
  #################################################
  #################################################

  #<< TEST CAPTURE >>
  test "can move with capture" do
    game = Game.create(:white_uid => 1, :black_uid => 2)
    pawn = game.pieces.find_by(:pos_x => 0, :pos_y => 1, :type => 'Pawn', :color => 0)
    pawn.update(:active => false)
    rook = game.pieces.find_by(:pos_x => 0, :pos_y => 0)
    bishop = game.pieces.find_by(:pos_x => 2, :pos_y => 7, :type => 'Bishop', :color => 1)
    bishop.update(:pos_x => 0, :pos_y => 5)
    assert rook.can_move_with_capture?([0,0],[0,5])
  end

  test "can move with capture fails" do
    game = Game.create(:white_uid => 1, :black_uid => 2)
    pawn = game.pieces.find_by(:pos_x => 0, :pos_y => 1, :type => 'Pawn', :color => 0)
    pawn.update(:active => false)
    rook = game.pieces.find_by(:pos_x => 0, :pos_y => 0)
    bishop = game.pieces.find_by(:type => 'Bishop', :color => 0)
    bishop.update(:pos_x => 0, :pos_y => 5)
    assert_not rook.can_move_with_capture?([0,0],[0,5])
  end
 
  test "can move without capture" do
    game = Game.create(:white_uid => 1, :black_uid => 2)
    pawn = game.pieces.find_by(:pos_x => 0, :pos_y => 1, :type => 'Pawn')
    pawn.update(:active => false)
    rook = game.pieces.find_by(:pos_x => 0, :pos_y => 0)
    assert rook.can_move_without_capture?([0,0],[0,2])
  end

  test "can move without capture fails" do
    game = Game.create(:white_uid => 1, :black_uid => 2)
    pawn = game.pieces.find_by(:pos_x => 0, :pos_y => 1, :type => 'Pawn')
    rook = game.pieces.find_by(:pos_x => 0, :pos_y => 0)
    assert_not rook.can_move_without_capture?([0,0],[0,2])
  end  

  # << TEST MOVE_TO! >>
  test "move to logic" do
    game = Game.create(:white_uid => 1, :black_uid => 2)
    pawn = game.pieces.find_by(:pos_x => 0, :pos_y => 1, :type => 'Pawn', :color => 0)
    pawn.update(:active => false)
    rook = game.pieces.find_by(:pos_x => 0, :pos_y => 0)
    bishop = game.pieces.find_by(:pos_x => 2, :pos_y => 7, :type => 'Bishop', :color => 1)
    bishop.update(:pos_x => 0, :pos_y => 5)
    assert rook.move_to!([0,0],[0,5])
  end

   # << TEST MOVE_TO! >>
  test "move to logic fails" do
    game = Game.create(:white_uid => 1, :black_uid => 2)
    pawn = game.pieces.find_by(:pos_x => 0, :pos_y => 1, :type => 'Pawn', :color => 0)
    pawn.update(:active => false)
    rook = game.pieces.find_by(:pos_x => 0, :pos_y => 0)
    bishop = game.pieces.find_by(:type => 'Bishop', :color => 0)
    bishop.update(:pos_x => 0, :pos_y => 5)
    assert_not rook.move_to!([0,0],[0,5])
  end
end
