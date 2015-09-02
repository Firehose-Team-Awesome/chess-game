class Piece < ActiveRecord::Base
	belongs_to :game

	scope :pawns, -> { where(type: 'Pawn') }
	scope :knights, -> { where(type: 'Knight') }
	scope :bishops, -> { where(type: 'Bishop') }
	scope :rooks, -> { where(type: 'Rook') }
	scope :queens, -> { where(type: 'Queen') }
	scope :kings, -> { where(type: 'King') }

	#define the types of pieces that are subclasses of Piece
	def self.types
		%w(Pawn Knight Bishop Rook Queen King)
	end
end

