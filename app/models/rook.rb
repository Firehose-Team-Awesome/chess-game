class Rook < Piece
	def valid_move?(end_point)
		# Define ending coordinates for rook
		end_x, end_y = end_point
		start_point = self.current_pos

		#check that the start and end points are on the board
		return false unless self.on_board?(end_point)
		
		#check to ensure the piece is not moved to the same location
		return false unless self.new_point?(end_point)

		#check for obstructions in path
		return false if self.is_obstructed?(start_point, end_point)

		#check to ensure piece is moving horizontally or vertically
		return false unless self.pos_x == end_x || self.pos_y == end_y

		#if passes previous validations, return true
		return true
	end
end