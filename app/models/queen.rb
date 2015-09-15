class Queen < Piece

	def valid_move?(end_point)
		# Define ending coordinates for queen
		end_x, end_y = end_point
		start_point = self.current_pos

		#check that the start and end points are on the board
		return false unless self.on_board?(end_point)
		
		#check to ensure the piece is not moved to the same location
		return false unless self.new_point?(end_point)

		#check for obstructions in path
		return false if self.is_obstructed?(start_point, end_point)

		#check if move is either diagonal, horizontal, or vertical
		#check diagonal
		if (self.pos_x - end_x).abs == (self.pos_y - end_y).abs
			return true
		elsif self.pos_x == end_x || self.pos_y == end_y
			return true
		else
			return false
		end

	end

end