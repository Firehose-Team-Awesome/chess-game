class StaticPagesController < ApplicationController
	def index
		@games = Game.joinable
	end
end