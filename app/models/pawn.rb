class Pawn < Piece
  def valid_move?(end_point)
    # Define ending coordinates
    end_x, end_y = end_point
    start_point = self.current_pos

    #check that the start and end points are on the board
    return false unless self.on_board?(end_point)
    
    #check to ensure the piece is not moved to the same location
    return false unless self.new_point?(end_point)

    #check for obstructions in path
    if end_x == self.pos_x
      return false if self.is_obstructed?(start_point, end_point)
    end

    #check if first move - 2 vertical spaces allowed, otherwise 1 vertical space allowed
    if self.created_at == self.updated_at
      return false if (end_y - self.pos_y).abs > 2
    else
      return false if (end_y - self.pos_y).abs > 1
    end

    #check that pawn is moving 'forward'
    if color == 0 #black piece, moving up
      return false if end_y < self.pos_y
    else #white piece, moving down
      return false if end_y > self.pos_y
    end

    #check that can't capture vertically, but can capture 1 space away horizontally
    if (end_x - self.pos_x).abs == 0 #vertical move
      return false if game.pieces.where(pos_x: end_x, pos_y: end_y, active: true).present?
    elsif (end_x - self.pos_x).abs == 1
      return true if game.pieces.where(pos_x: end_x, pos_y: end_y, active: true).present?
    elsif (end_x - self.pos_x).abs > 1
      return false
    end

    #if passes all previous validations, return true
    return true 
  end
end