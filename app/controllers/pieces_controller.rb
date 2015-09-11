class PiecesController < ApplicationController
	def show
    @piece = Piece.find(params[:id])
    @pieces = @piece.game.pieces # display all the pieces on the board
  end

  private

  def piece_params
    params.require(:piece).permit(:pos_x, :pos_y)
  end
end
