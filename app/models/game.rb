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

	def is_color_in_check?(color)
	  king = pieces.where(type: :King, color: color)
	  if color == Piece::COLORS[:black]
	  	pieces = pieces.where(color: Piece::COLORS[:white], active: true)
	  else 
	  	pieces = pieces.where(color: Piece::COLORS[:black], active: true)
	  end
	  in_check = false
	  pieces.each do |piece|
	  	if piece.can_move_with_capture?(king.pos_x, king.pos_y)
	  		in_check = true
	  	end
	  end
	  return in_check
	end
end

