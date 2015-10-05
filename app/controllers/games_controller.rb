class GamesController < ApplicationController

	def show
    @game = Game.find(params[:id])
    @pieces = @game.pieces
    @black_player = User.find_by(id: @game.black_uid)
    @white_player = User.find_by(id: @game.white_uid)
    if @game.is_color_in_check?(Piece::COLORS[:black]) && @game.is_color_in_check?(Piece::COLORS[:white])
      flash[:notice] = "Both players are in check." 
    elsif @game.is_color_in_check?(Piece::COLORS[:black])
      flash[:notice] = "Black player is in check." 
    elsif @game.is_color_in_check?(Piece::COLORS[:white])
      flash[:notice] = "White player is in check." 
    end  
  end

	def edit
		@game = Game.find(params[:id])
	end

	def update
		@game = Game.find(params[:id])
		@game.update_attributes(game_params)
		flash[:notice] = "You successfully joined the game!"
		redirect_to game_path(@game)
	end

	private

	def game_params
		params.require(:game).permit(:black_uid)
	end
end
