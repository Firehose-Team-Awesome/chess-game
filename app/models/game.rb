class Game < ActiveRecord::Base
  has_many :pieces
  delegate :pawns, :knights, :bishops, :rooks, :queens, :kings, to: :pieces

  belongs_to :white_user, class_name: 'User', foreign_key: 'white_uid'
  belongs_to :black_user, class_name: 'User', foreign_key: 'black_uid'

  after_create :populate_board!
  
 	def populate_board!
 		game = Game.last.id
	
		#####create rooks######
		0.step(7,7) do |x|
			Rook.create!(
				:pos_x => x,
				:pos_y => 0,
				:color => 0,
				:game_id => game
			)
		end
		
		0.step(7,7) do |x|
			Rook.create!(
				:pos_x => x,
				:pos_y => 7,
				:color => 1,
				:game_id => game
			)
		end

		######create knights######
		1.step(6,5) do |x|
			Knight.create!(
				:pos_x => x,
				:pos_y => 0,
				:color => 0,
				:game_id => game
			)
		end
		
		1.step(6,5) do |x|
			Knight.create!(
				:pos_x => x,
				:pos_y => 7,
				:color => 1,
				:game_id => game
			)
		end

		######create bishops######
		2.step(5,3) do |x|
			Bishop.create!(
				:pos_x => x,
				:pos_y => 0,
				:color => 0,
				:game_id => game
			)
		end
		
		2.step(5,3) do |x|
			Bishop.create!(
				:pos_x => x,
				:pos_y => 7,
				:color => 1,
				:game_id => game
			)
		end	

		######create queens######
		Queen.create!(
			:pos_x => 4,
			:pos_y => 0,
			:color => 0,
			:game_id => game
		)

		Queen.create!(
			:pos_x => 3,
			:pos_y => 7,
			:color => 1,
			:game_id => game
		)

		######create kings######
		King.create!(
			:pos_x => 3,
			:pos_y => 0,
			:color => 0,
			:game_id => game
		)

		King.create!(
			:pos_x => 4,
			:pos_y => 7,
			:color => 1,
			:game_id => game
		)

		######create pawns######
		0.step(7,1) do |x|
			Pawn.create!(
				:pos_x => x,
				:pos_y => 1,
				:color => 0,
				:game_id => game
			)
		end
		
		0.step(7,1) do |x|
			Pawn.create!(
				:pos_x => x,
				:pos_y => 6,
				:color => 1,
				:game_id => game
			)
		end	
	end

	def self.joinable	
		where(Game.arel_table[:white_uid].eq(nil).or(Game.arel_table[:black_uid].eq(nil)))
	end
end

