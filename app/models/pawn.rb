class Pawn < Piece
def valid_move?(end_x, end_y)
    if occupied?(end_x, end_y)
      x_distance = (end_x - pos_x)
      y_distance = (end_y - pos_y)
      if color == 'white'
        x_distance.abs == 1 && y_distance == 1
      elsif color == 'black'
        x_distance.abs == 1 && y_distance == -1
      end
    elsif color == 'white'
      if pos_y == 1 || pos_y == 6           # If Pawn at starting position it can move either 1 or 2 places forward
        x_distance = (end_x - pos_x)
        y_distance = (end_y - pos_y)

        (x_distance == 0 && y_distance == 1) || (x_distance == 0 && y_distance == 2) && !obstructed?([end_x, end_y])
      else                                  # If Pawn at any other position other than start it can move 1 place forward
        x_distance = (end_x - pos_x)
        y_distance = (end_y - pos_y)

        (x_distance == 0 && y_distance == 1) && !obstructed?([end_x, end_y])
      end
    elsif color == 'black'
      if pos_y == 1 || pos_y == 6           # If Pawn at starting position it can move either 1 or 2 places forward
        x_distance = (pos_x - end_x)
        y_distance = (pos_y - end_y)

        (x_distance == 0 && y_distance == 1) || (x_distance == 0 && y_distance == 2) && !obstructed?([end_x, end_y])
      else                                  # If Pawn at any other position other than start it can move 1 place forward
        x_distance = (pos_x - end_x)
        y_distance = (pos_y - end_y)

        (x_distance == 0 && y_distance == 1) && !obstructed?([end_x, end_y])
      end
    end
  end
end
