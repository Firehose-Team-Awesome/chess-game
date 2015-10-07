class GamesController < ApplicationController

	def show
    @game = Game.find(params[:id])
    @pieces = @game.pieces
    @black_player = User.find_by(id: @game.black_uid)
    @white_player = User.find_by(id: @game.white_uid)
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

  def concede
    @game = Game.find(params[:id])
    @black_player = User.find_by(id: @game.black_uid)
    @white_player = User.find_by(id: @game.white_uid)
    @current_player = User.find(params[:id])
    if @black_player == @current_player
      @game.winner_id = @white_player
    else
      @game.winner_id = @black_player
    end
    @game.update_attributes(winner_params)
  end

	private

	def game_params
		params.require(:game).permit(:black_uid)
	end

  def winner_params
    params.require(:game).permit(:winner_id)
  end
end
