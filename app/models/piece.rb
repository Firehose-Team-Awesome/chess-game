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

	#Determine if there are obstructions "between" two squares, start_point and end_point, to validate a piece can succesfully be moved.  
	#Accepts x and y coordinates for piece starting position and ending position.
	#Returns false if no obstruction exists, true if obstruction exists.

	def is_obstructed?(start_point, end_point)
		error = "Invalid input.  Not diagonal, horizontal, or vertical"
		# determine if searching horizontal, vertical, or diagonal search.
			# loop through the x and y coordinates that exist between the two points provided.
				# find out if a piece is in the current x,y coordinate for this game.
		start_x, start_y = start_point
		end_x, end_y = end_point

		# check for vertical search, x coordinates being the same value
		if start_x == end_x 
		    min_y = [start_y, end_y].min 
		    max_y = [start_y, end_y].max
		    # creates an array of the y piece positions less starting and ending moves
		    y_array = (min_y..max_y).to_a - [min_y, max_y]  
			return game.pieces.where(pos_x: start_x, pos_y: y_array, active: true).present?
		#check for horizontal search, y coordinates being the same value
		elsif start_y == end_y
			min_x = [start_x, end_x].min
			max_x = [start_x, end_x].max 
			# creates an array of the x piece positions less starting and ending moves
			x_array = (min_x..max_x).to_a - [min_x, max_x]
			return game.pieces.where(pos_x: x_array, pos_y: start_y, active: true).present?
		# check for diagonal search 
		#elsif    
			#evaluate if start_x less than end_x...
			

		else
			return error
		end
	end

end

