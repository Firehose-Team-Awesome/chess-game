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
		if opponent_pawn.updated_at == game.updated_at && opponent_pawn.en_passant == true 
			return true
		else
			return false
		end
	end

	
end
