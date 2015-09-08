class King < Piece

	def valid_move?(start_point, end_point)
		# Define starting and ending coordinates for pieces
		start_x, start_y = start_point
		end_x, end_y = end_point

		#determine if move is only 1 space in any direction
		if (start_x - end_x).abs <= 1 && (start_y - end_y).abs <= 1
			#then check if space is occupied
			(game.pieces.where(pos_x: end_x, pos_y: end_y, active: true).present?) ? false : true
			
			#once movement for other pieces is sorted out, this method will also have to check
			#if the space the king is moving into will put it in check, which will also be an
			#invalid move
		end



	end

	

end