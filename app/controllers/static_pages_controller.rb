class StaticPagesController < ApplicationController
	def index
		@games = Game.joinable
		@open_games = Game.where(:black_uid => nil)
	end
	
end