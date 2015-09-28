class King < Piece

	def valid_move?(end_point)
		# Define ending coordinates for king
		end_x, end_y = end_point

		#check that the start and end points are on the board
		return false unless self.on_board?(end_point)
		
		#check to ensure the piece is not moved to the same location
		return false unless self.new_point?(end_point)

		#determine if move is only 1 space in any direction
		return (self.pos_x - end_x).abs <= 1 && (self.pos_y - end_y).abs <= 1
			
		#once movement for other pieces is sorted out, this method will also have to check
		#if the space the king is moving into will put it in check, which will also be an
		#invalid move
	end
end