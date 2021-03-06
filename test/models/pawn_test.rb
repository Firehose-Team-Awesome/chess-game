require 'test_helper'

class PawnTest < ActiveSupport::TestCase  
  ##### TEST VALID_MOVE METHOD ######
  # --> clear test db --> rake db:test:prepare

  test "check if move is valid (invalid case, no movement)" do
    game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
    pawn = game.pieces.where(:pos_x => 0).where(:pos_y => 1).first
    move = pawn.valid_move?([0, 1])
    assert_not move
  end

  test "check if move is valid (invalid case, off board)" do
    game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
    pawn = game.pieces.where(:pos_x => 0).where(:pos_y => 1).first
    move = pawn.valid_move?([-1, 1])
    assert_not move
  end

  test "check if move is valid (invalid case, obstruction)" do
    game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
    rook = Rook.create(:pos_x => 0, :pos_y => 2, :active => true, :game_id => game.id)
    pawn = game.pieces.where(:pos_x => 0).where(:pos_y => 1).first
    move = pawn.valid_move?([0, 3])
    assert_not move
  end
  
  test "check if move is valid (valid case, starting - one space forward)" do
    game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
    pawn = game.pieces.where(:pos_x => 0).where(:pos_y => 1).first
    move = pawn.valid_move?([0, 2])
    assert move
  end

  test "check if move is valid (valid case, starting - two spaces forward)" do
    game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
    pawn = game.pieces.where(:pos_x => 0).where(:pos_y => 1).first
    move = pawn.valid_move?([0, 3])
    assert move
  end

  test "check if move is valid (invalid case, starting - three spaces forward)" do
    game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
    pawn = game.pieces.where(:pos_x => 0).where(:pos_y => 1).first
    move = pawn.valid_move?([0, 4])
    assert_not move
  end

  test "check if move is valid (invalid case, capture vertically)" do
    game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
    rook = Rook.create(:pos_x => 0, :pos_y => 2, :active => true, :game_id => game.id)
    pawn = game.pieces.where(:pos_x => 0).where(:pos_y => 1).first
    move = pawn.valid_move?([0, 2])
    assert_not move
  end

  test "check if move is valid (valid case, starting - capture diagonal - 1 space forward)" do
    game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
    rook = Rook.create(:pos_x => 1, :pos_y => 2, :active => true, :game_id => game.id)
    pawn = game.pieces.where(:pos_x => 0).where(:pos_y => 1).first
    move = pawn.valid_move?([1, 2])
    assert move
  end

  test "check if move is valid (valid case, starting - capture diagonal - 2 spaces forward)" do
    game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
    rook = Rook.create(:pos_x => 1, :pos_y => 3, :active => true, :game_id => game.id)
    pawn = game.pieces.where(:pos_x => 0).where(:pos_y => 1).first
    move = pawn.valid_move?([1, 3])
    assert move
  end

  test "check if move is valid (invalid case, starting - capture diagonal - 3 space forward)" do
    game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
    rook = Rook.create(:pos_x => 1, :pos_y => 4, :active => true, :game_id => game.id)
    pawn = game.pieces.where(:pos_x => 0).where(:pos_y => 1).first
    move = pawn.valid_move?([1, 4])
    assert_not move
  end

  test "check if move is valid (valid case, second move - one space forward)" do
    game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
    pawn = game.pieces.where(:pos_x => 0).where(:pos_y => 1).first
    pawn.update_attributes(:pos_y => 2)
    move = pawn.valid_move?([0, 3])
    assert move
  end

  test "check if move is valid (invalid case, second move - two spaces forward)" do
    game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
    pawn = game.pieces.where(:pos_x => 0).where(:pos_y => 1).first
    pawn.update_attributes(:pos_y => 2)
    move = pawn.valid_move?([0, 4])
    assert_not move
  end

  test "check if move is valid (invalid case, backward move)" do
    game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
    pawn = game.pieces.where(:pos_x => 0).where(:pos_y => 1).first
    pawn.update_attributes(:pos_y => 3)
    move = pawn.valid_move?([0, 2])
    assert_not move
  end

  test "check if move is valid (invalid case, horizontal move)" do
    game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
    pawn = game.pieces.where(:pos_x => 0).where(:pos_y => 1).first
    pawn.update_attributes(:pos_y => 2)
    move = pawn.valid_move?([1, 2])
    assert_not move
  end

  test "check if move is valid (invalid case, big jump)" do
    game = Game.create(:white_uid => 1, :black_uid => 1, :game_name => "New Game")
    pawn = game.pieces.where(:pos_x => 0).where(:pos_y => 1).first
    move = pawn.valid_move?([3, 4])
    assert_not move
  end

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
    assert can_capture
  end

end