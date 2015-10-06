class PiecesController < ApplicationController

	def show
    @piece = Piece.find(params[:id])
    @pieces = @piece.game.pieces # display all the pieces on the board
  end

  def update
    @piece = Piece.find(params[:id])
    @game = @piece.game
    @color = @piece.color
    @last_move = Piece.order(:updated_at).last.color

    if @color == Piece::COLORS[:black]
    	@color = 'white'
    else
    	@color = 'black'
    end

    if @last_move == Piece::COLORS[:black]
      @last_move = 'white'
      flash[:notice] = "It is black player's turn." 
    else
      @last_move = 'black'
      flash[:notice] = "It is white player's turn." 
    end

    pos_x = params[:pos_x].to_i
    pos_y = params[:pos_y].to_i
    valid_move = false

    Piece.transaction do
      if @piece.valid_move?([pos_x, pos_y]) && @last_move != @color
        valid_move = true
        @piece.move_to!([@piece.pos_x, @piece.pos_y],[pos_x, pos_y])
      else
        valid_move = false
      end
  	end

  	respond_to do |format|
      format.html do
        redirect_to game_path(@game)  # redirect to game show page
      end
      format.json do
        json_result = {valid: valid_move, active: @piece.active, captured: @piece.captured, not_color: @color}
        render json: json_result
      end
    end
  end

  private

  def piece_params
    params.require(:piece).permit(:pos_x, :pos_y)
  end
end
