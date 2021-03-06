class Piece < ActiveRecord::Base
	belongs_to :game

  attr_accessor :captured
	attr_reader :valid, :not_color

	scope :pawns, -> { where(type: 'Pawn') }
	scope :knights, -> { where(type: 'Knight') }
	scope :bishops, -> { where(type: 'Bishop') }
	scope :rooks, -> { where(type: 'Rook') }
	scope :queens, -> { where(type: 'Queen') }
	scope :kings, -> { where(type: 'King') }
	
	COLORS = {black:0, white:1}

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
			sql_string = ""
			x_array.zip(y_array).each do |x,y|
				sql_string += " ( pos_x = #{x} and pos_y = #{y} and active = true ) or"
			end
			sql_string += " false "
			return game.pieces.where( sql_string ).present?
		else
			return error_msg
		end
	end

	#get piece's current (start) position
	def current_pos
		return arr = [pos_x, pos_y]
	end

	#check if a move is being made to a new position
	def new_point?(end_point)
		end_x, end_y = end_point
		!(pos_x == end_x && pos_y == end_y) 
	end

	#check if current position is on board
	def on_board?(end_point)
		end_x, end_y = end_point
		return false if pos_x < 0 || pos_x > 7
		return false if pos_y < 0 || pos_y > 7
		return false if end_x < 0 || end_x > 7
		return false if end_y < 0 || end_y > 7
		return true
	end

	def do_move!(pos_x, pos_y)
		self.update_attributes(pos_x: pos_x, pos_y: pos_y)
  end

  def is_occupied?(x, y)
    game.pieces.where(pos_x: x, pos_y: y, active: true).present?
  end

  def can_move_without_capture?(start_pos,dest_pos)
  	start_x, start_y = start_pos
  	dest_x, dest_y = dest_pos
  	#debugger
    if self.type != 'Knight'
      !is_obstructed?([start_x, start_y],[dest_x, dest_y]) && !is_occupied?(dest_x, dest_y) && valid_move?([dest_x, dest_y])
    else
      !is_occupied?(dest_x, dest_y) && valid_move?([dest_x, dest_y])
    end
  end

  def can_move_with_capture?(start_pos,dest_pos)
		start_x, start_y = start_pos
  	dest_x, dest_y = dest_pos
  	#debugger
  	dest_piece = game.pieces.find_by(pos_x: dest_x, pos_y: dest_y, active: true)
  	if self.type != 'Knight'
      return (
    		!is_obstructed?([start_x, start_y],[dest_x, dest_y]) && 
    		is_occupied?(dest_x, dest_y) &&
    		valid_move?([dest_x, dest_y]) &&
    		dest_piece.color != color 
    	)
    else
      return (
        is_occupied?(dest_x, dest_y) &&
        valid_move?([dest_x, dest_y]) &&
        dest_piece.color != color 
      )
    end
  end

  def move_to!(start_pos, dest_pos)
  	dest_x, dest_y = dest_pos
  	captured = false
  	pos_occuppied = game.pieces.find_by(pos_x: dest_x, pos_y: dest_y, active: true)
  	#debugger
    if !pos_occuppied.blank? 
    	#debugger
      if can_move_with_capture?(start_pos, dest_pos)
    		dest_piece = game.pieces.find_by(pos_x: dest_x, pos_y: dest_y, active: true)
    		dest_piece.update_attributes(active: false)
    		update_attributes(pos_x: dest_x, pos_y: dest_y)
    		captured = true
    	end
    elsif can_move_without_capture?(start_pos, dest_pos)
        update_attributes(pos_x: dest_x, pos_y: dest_y)
        captured = true
    end
    return captured
  end
 
  def can_castle_kingside?(rook, king)
		return false if rook.created_at != rook.updated_at
		return false if king.created_at != king.updated_at
		return false if rook.is_obstructed?(rook.current_pos, [king.pos_x - 1, king.pos_y])
		return true
  end

  def can_castle_queenside?(rook, king)
		return false if rook.created_at != rook.updated_at
		return false if king.created_at != king.updated_at
		return false if rook.is_obstructed?(rook.current_pos, [king.pos_x + 1, king.pos_y])
		return true
  end

  def castle_kingside!(rook, king)
  	king.update_attributes(:pos_x => 0)
  	rook.update_attributes(:pos_x => 3)
  end

  def castle_queenside!(rook, king)
  	king.update_attributes(:pos_x => 7)
  	rook.update_attributes(:pos_x => 3)
  end

end
