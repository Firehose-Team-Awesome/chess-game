class Piece < ActiveRecord::Base
	belongs_to :game

	scope :pawns, -> { where(type: 'Pawn') }
	scope :knights, -> { where(type: 'Knight') }
	scope :bishops, -> { where(type: 'Bishop') }
	scope :rooks, -> { where(type: 'Rook') }
	scope :queens, -> { where(type: 'Queen') }
	scope :kings, -> { where(type: 'King') }

	#define the types of pieces that are subclasses of Piece
	def self.types
		%w(Pawn Knight Bishop Rook Queen King)
	end

	# Determine if there are obstructions "between" two chess pieces
	# to validate a piece can succesfully be moved.  Accepts x and y coordinates 
	# for both pieces being compared.  Returns false if no obstruction exists, true if obstruction exists.
	def is_obstructed?(start_point, end_point)
		error_msg = "Invalid input.  Not diagonal, horizontal, or vertical"

		# Define starting and ending coordinates for pieces
		start_x, start_y = start_point
		end_x, end_y = end_point

		# Determine if piece is moving vertically, x coordinates being the same value
		if start_x == end_x 
		    min_y = [start_y, end_y].min 
		    max_y = [start_y, end_y].max
		    # creates an array of the y piece positions less starting and ending positions
		    y_array = (min_y..max_y).to_a - [min_y, max_y]  
		    # check current game piece locations for obstruction
			return game.pieces.where(pos_x: start_x, pos_y: y_array, active: true).present?
		# Determine if piece is moving horizontally, y coordinates being the same value
		elsif start_y == end_y
			min_x = [start_x, end_x].min
			max_x = [start_x, end_x].max 
			# creates an array of the x piece positions less starting and ending positions
			x_array = (min_x..max_x).to_a - [min_x, max_x]
			# check current game piece locations for obstruction
			return game.pieces.where(pos_x: x_array, pos_y: start_y, active: true).present?
		# Determine if piece in moving diagonally, the number of positions moved horizontally and vertically are equal.
		elsif (start_x - end_x).abs == (start_y - end_y).abs
			# Get the starting and ending range of x and y coordinates
			min_x = [start_x,end_x].min 
			max_x = [start_x, end_x].max 
			min_y = [start_y, end_y].min
			max_y = [start_y, end_y].max
			# Establish array of x and y coordinates less starting and ending positions
			x_array = (min_x..max_x).to_a - [min_x, max_x]
			y_array = (min_y..max_y).to_a - [min_y, max_y]
			# Correct the x and y coordinates if the piece is moving in opposite direction.
			if start_x > end_x
				x_array = x_array.reverse
			end
			if start_y > end_y
				y_array = y_array.reverse
			end
			# check current game piece locations for obstruction
			return game.pieces.where(pos_x: x_array, pos_y: y_array, active: true).present?
		else
			return error_msg
		end
	end

end

