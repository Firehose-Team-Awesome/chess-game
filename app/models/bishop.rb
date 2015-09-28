class Bishop < Piece
	def valid_move?(end_point)
		# Define ending coordinates for bishop
		end_x, end_y = end_point
		start_point = self.current_pos

		#check that the start and end points are on the board
		return false unless self.on_board?(end_point)
		
		#check to ensure the piece is not moved to the same location
		return false unless self.new_point?(end_point)

		#check for obstructions in path
		return false if self.is_obstructed?(start_point, end_point)

		#determine if move is diagonal
		(-7..7).each do |i|
			if self.pos_x + i == end_x && self.pos_y + i == end_y
				return true
			elsif self.pos_x + i == end_x && self.pos_y - i == end_y
				return true
			end
		end

		#if move doesn't return true for diagonal move validation, return false
		return false
	end
end