class GamesController < ApplicationController

	def index
		@games = Game.all
		@open_games = Game.where(:black_uid => nil)
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
