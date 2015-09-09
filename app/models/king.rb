class King < Piece

	def valid_move?(start_point, end_point)
		# Define starting and ending coordinates for pieces
		start_x, start_y = start_point
		end_x, end_y = end_point

		#check that the start and end points are on the board
		return false if start_x < 0 || start_x > 7
		return false if start_y < 0 || start_y > 7
		return false if end_x < 0 || end_x > 7
		return false if end_y < 0 || end_y > 7

		#check to ensure the piece is not moved to the same location
		return false if start_point == end_point

		#determine if move is only 1 space in any direction
		return (start_x - end_x).abs <= 1 && (start_y - end_y).abs <= 1
			
		#once movement for other pieces is sorted out, this method will also have to check
		#if the space the king is moving into will put it in check, which will also be an
		#invalid move
	end

	

end