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

	def new

  	@game = Game.new

	end

	def create

  	@game = current_user.games.create(game_params)
	  if @game.valid?
      redirect_to game_path(@game)
    else
      render :new, :status => :unprocessable_entity
    end
  end

	private

	def game_params
		params.require(:game).permit(:black_uid, :white_uid, :game_name).merge(:white_uid => current_user.id)
	end
end
