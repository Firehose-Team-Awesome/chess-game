class PiecesController < ApplicationController
  attr_accessor :captured

	def show
    @piece = Piece.find(params[:id])
    @pieces = @piece.game.pieces # display all the pieces on the board
  end

  def update
    @piece = Piece.find(params[:id])
    @game = @piece.game
    @color = @piece.color

    if @color == 0
    	@color = 'white'
    else
    	@color = 'black'
    end

    pos_x = params[:pos_x].to_i
    pos_y = params[:pos_y].to_i

    Piece.transaction do
      @piece.do_move!(pos_x, pos_y)
  	end

  	respond_to do |format|
      format.html do
        redirect_to game_path(@game)  # redirect to game show page
      end
      format.json do
        json_result = {valid: true, active: @piece.active, captured: captured, not_color: @color}
        render json: json_result
      end
    end
  end

  private

  def piece_params
    params.require(:piece).permit(:pos_x, :pos_y)
  end
end
