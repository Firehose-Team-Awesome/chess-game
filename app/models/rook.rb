class Rook < Piece
	def move
	end

	def new
		create_rook(:color => 0, :game_id => self.id)
	end
end