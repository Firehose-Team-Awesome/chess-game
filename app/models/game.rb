class Game < ActiveRecord::Base
  has_many :pieces
  delegate :pawns, :knights, :bishops, :rooks, :queens, :kings, to: :pieces

  belongs_to :white_user, class_name: 'User', foreign_key: 'white_uid'
  belongs_to :black_user, class_name: 'User', foreign_key: 'black_uid'

  after_create :populate_board!
  



 	def populate_board!
 		game = self.id
	
		#####create rooks######
		0.step(7,7) do |x|
			Rook.create!(
				:pos_x => x,
				:pos_y => 0,
				:color => 0,
				:game_id => game,
				:image => 'rook-black.png',
				:active => 1
			)
		end
		
		0.step(7,7) do |x|
			Rook.create!(
				:pos_x => x,
				:pos_y => 7,
				:color => 1,
				:game_id => game,
				:image => 'rook-white.png',
				:active => 1
			)
		end

		######create knights######
		1.step(6,5) do |x|
			Knight.create!(
				:pos_x => x,
				:pos_y => 0,
				:color => 0,
				:game_id => game,
				:image => 'knight-black.png',
				:active => 1
			)
		end
		
		1.step(6,5) do |x|
			Knight.create!(
				:pos_x => x,
				:pos_y => 7,
				:color => 1,
				:game_id => game,
				:image => 'knight-white.png',
				:active => 1				
			)
		end

		######create bishops######
		2.step(5,3) do |x|
			Bishop.create!(
				:pos_x => x,
				:pos_y => 0,
				:color => 0,
				:game_id => game,
				:image => 'bishop-black.png',
				:active => 1				
			)
		end
		
		2.step(5,3) do |x|
			Bishop.create!(
				:pos_x => x,
				:pos_y => 7,
				:color => 1,
				:game_id => game,
				:image => 'bishop-white.png',
				:active => 1
			)
		end	

		######create queens######
		Queen.create!(
			:pos_x => 4,
			:pos_y => 0,
			:color => 0,
			:game_id => game,
			:image => 'queen-black.png',
			:active => 1
		)

		Queen.create!(
			:pos_x => 4,
			:pos_y => 7,
			:color => 1,
			:game_id => game,
			:image => 'queen-white.png',
			:active => 1
		)

		######create kings######
		King.create!(
			:pos_x => 3,
			:pos_y => 0,
			:color => 0,
			:game_id => game,
			:image => 'king-black.png',
			:active => 1
		)

		King.create!(
			:pos_x => 3,
			:pos_y => 7,
			:color => 1,
			:game_id => game,
			:image => 'king-white.png',
			:active => 1
		)

		######create pawns######
		0.step(7,1) do |x|
			Pawn.create!(
				:pos_x => x,
				:pos_y => 1,
				:color => 0,
				:game_id => game,
				:image => 'pawn-black.png',
				:active => 1
			)
		end
		
		0.step(7,1) do |x|
			Pawn.create!(
				:pos_x => x,
				:pos_y => 6,
				:color => 1,
				:game_id => game,
				:image => 'pawn-white.png',
				:active => 1
			)
		end	
	end

	def self.joinable	
		where(Game.arel_table[:white_uid].eq(nil).or(Game.arel_table[:black_uid].eq(nil)))
	end

	def is_color_in_check?(test_color)
	  king = self.pieces.find_by(:type => 'King', :color => test_color)
	  if test_color == Piece::COLORS[:black]
	  	opposite_pieces = self.pieces.where(:color => 1, :active => true)
	  else
	  	opposite_pieces = self.pieces.where(:color => 0, :active => true)
	  end
	  in_check = false
	  opposite_pieces.each do |opposite_piece|
	  	start_pos = [opposite_piece.pos_x, opposite_piece.pos_y]
	  	dest_pos = [king.pos_x, king.pos_y]
	  	if opposite_piece.can_move_with_capture?(start_pos, dest_pos)
	  		in_check = true
	  	end
	  end
	  return in_check
	end

	def is_color_in_checkmate?(test_color)
		#This assumes that is_color_in_check? method has already been called on piece.
    #If this method returns false, call is_color_in_check? again after the move has been made, and if it is still in check, end the game.
		king = self.pieces.find_by(:type => 'King', :color => test_color)
		#First check if king has any open moves.
		-1.upto(1) do |i|
			-1.upto(1) do |j|
				return false if king.can_move_without_capture?([pos_x, pos_y], [pos_x + i, pos_y + j]) || king.can_move_with_capture?([pos_x, pos_y], [pos_x + i, pos_y + j])
			end
		end

		#Next check if a friendly piece can capture the piece or block capture.
		if test_color == Piece::COLORS[:black]
	  	opposite_pieces = self.pieces.where(:color => 1, :active => true)
      friendly_pieces = self.pieces.where(:color => 0, :active => true)
	  else
	  	opposite_pieces = self.pieces.where(:color => 0, :active => true)
      friendly_pieces = self.pieces.where(:color => 1, :active => true)
	  end
    king_pos = [king.pos_x, king.pos_y]
	  opposite_pieces.each do |opposite_piece|
	  	start_pos_opposite = [opposite_piece.pos_x, opposite_piece.pos_y]	
      #check if piece can capture blocked piece  	
	  	if opposite_piece.can_move_with_capture?(start_pos_opposite, king_pos)
	  		friendly_pieces.each do |friendly_piece|
          start_pos_friendly = [friendly_piece.pos_x, friendly_piece.pos_y]
          if friendly_piece.can_move_with_capture?(start_pos_friendly, start_pos_opposite)
            return false
          else
            #checking vertical moving pieces
            if king.pos_x - opposite_piece.pos_x == 0
              if king.pos_y < opposite_piece.pos_y
                (king.pos_y..opposite_piece.pos_y).each do |i|
                  return false if friendly_piece.can_move_without_capture?(start_pos_friendly, [opposite_piece.pos_x, i])
                end
              elsif king.pos_y > opposite_piece.pos_y
                (opposite_piece.pos_y..king.pos_y).each do |i|
                  return false if friendly_piece.can_move_without_capture?(start_pos_friendly, [opposite_piece.pos_x, i])
                end
              end
            #checking horizontal moving pieces
            elsif king.pos_y - opposite_piece.pos_y == 0
              if king.pos_x < opposite_piece.pos_x
                (king.pos_x..opposite_piece.pos_x).each do |i|
                  return false if friendly_piece.can_move_without_capture?(start_pos_friendly, [opposite_piece.pos_y, i])
                end
              elsif king.pos_x > opposite_piece.pos_x
                (opposite_piece.pos_x..king.pos_x).each do |i|
                  return false if friendly_piece.can_move_without_capture?(start_pos_friendly, [opposite_piece.pos_y, i])
                end
              end
            #checking diagonal moving pieces
            elsif (king.pos_y - opposite_piece.pos_y).abs == (king.pos_x - opposite_piece.pos_x).abs
              if king.pos_x < opposite_piece.pos_x
                (king.pos_x..opposite_piece.pos_x).each do |i|
                  return false if friendly_piece.can_move_without_capture?(start_pos_friendly, [opposite_piece.pos_y, i])
                end
              elsif king.pos_x > opposite_piece.pos_x
                (opposite_piece.pos_x..king.pos_x).each do |i|
                  return false if friendly_piece.can_move_without_capture?(start_pos_friendly, [opposite_piece.pos_y, i])
                end
              end
            end

          end
        end
	  	end
	  end
	end

end

