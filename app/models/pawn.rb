class Pawn < Piece

	#en passant status of self
	def update_en_passant_status(end_x, end_y)
		if (self.pos_y - end_y).abs == 2
			self.update_attributes(en_passant: true)
		else
			self.update_attributes(en_passant: false)
		end
	end

	#determine if pawn can capture opposing pawn en passant
	def can_capture_en_passant(opponent_pawn)
		if opponent_pawn.en_passant == true && opponent_pawn.updated_at == game.updated_at
			return true
		else
			return false
		end
	end

	#do the capture en passant move
	def capture_en_passant(opponent_pawn)
		pos_x = opponent_pawn.pos_x
		pos_y = opponent_pawn.pos_y

		if can_capture_en_passant(opponent_pawn)
			#first move to where opponent pawn actually is to take care of capturing the piece
			self.move_to!(pos_x, pos_y)

			#then move from where the pawn was to one space behind it, where it was theoretically "captured" in passing
			#determine if captured pawn was on top or bottom side of board
			if pos_y == 3
				self.move_to!(pos_x, 2)
			else
				self.move_to!(pos_x, 5)
			end
		end

	end
end
