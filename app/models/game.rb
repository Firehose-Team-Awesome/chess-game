class Game < ActiveRecord::Base
  has_many :pieces
  delegate :pawns, :knights, :bishops, :rooks, :queens, :kings, to: :pieces

  belongs_to :white_user, class_name: 'User', foreign_key: 'white_uid'
  belongs_to :black_user, class_name: 'User', foreign_key: 'black_uid'

  after_create :populate_board!
  
 	def populate_board!
 		game = Game.last.id
	
		######create rooks######
		0.step(7,7) do |x|
			Piece.create!(
				:type => "Rook",
				:pos_x => x,
				:pos_y => 0,
				:color => 0,
				:game_id => game
			)
		end
		
		0.step(7,7) do |x|
			Piece.create!(
				:type => "Rook",
				:pos_x => x,
				:pos_y => 7,
				:color => 1,
				:game_id => game
			)
		end

		######create knights######
		1.step(6,5) do |x|
			Piece.create!(
				:type => "Knight",
				:pos_x => x,
				:pos_y => 0,
				:color => 0,
				:game_id => game
			)
		end
		
		1.step(6,5) do |x|
			Piece.create!(
				:type => "Knight",
				:pos_x => x,
				:pos_y => 7,
				:color => 1,
				:game_id => game
			)
		end

		######create bishops######
		2.step(5,3) do |x|
			Piece.create!(
				:type => "Bishop",
				:pos_x => x,
				:pos_y => 0,
				:color => 0,
				:game_id => game
			)
		end
		
		2.step(5,3) do |x|
			Piece.create!(
				:type => "Bishop",
				:pos_x => x,
				:pos_y => 7,
				:color => 1,
				:game_id => game
			)
		end	

		######create queens######
		Piece.create!(
			:type => "Queen",
			:pos_x => 4,
			:pos_y => 0,
			:color => 0,
			:game_id => game
		)

		Piece.create!(
			:type => "Queen",
			:pos_x => 3,
			:pos_y => 7,
			:color => 1,
			:game_id => game
		)

		######create kings######
		Piece.create!(
			:type => "King",
			:pos_x => 3,
			:pos_y => 0,
			:color => 0,
			:game_id => game
		)

		Piece.create!(
			:type => "King",
			:pos_x => 4,
			:pos_y => 7,
			:color => 1,
			:game_id => game
		)

		######create pawns######
		0.step(7,1) do |x|
			Piece.create!(
				:type => "Pawn",
				:pos_x => x,
				:pos_y => 1,
				:color => 0,
				:game_id => game
			)
		end
		
		0.step(7,1) do |x|
			Piece.create!(
				:type => "Pawn",
				:pos_x => x,
				:pos_y => 6,
				:color => 1,
				:game_id => game
			)
		end	
	end
end

