class Knight < Piece

	def valid_move?(end_point)
		# Define ending coordinates for knight
		end_x, end_y = end_point

		#check that the start and end points are on the board
		return false unless self.on_board?(end_point)
		
		#check to ensure the piece is not moved to the same location
		return false unless self.new_point?(end_point)

		
		#check if move is an 'L' shape	
		if (self.pos_x - end_x).abs == 2 && (self.pos_y - end_y).abs == 1
			return true
		elsif (self.pos_x - end_x).abs == 1 && (self.pos_y - end_y).abs == 2
			return true
		else
			return false
		end
	end
	
end