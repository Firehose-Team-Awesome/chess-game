class User < ActiveRecord::Base
	#has_many :games_as_white_uid, :foreign_key =>'white_uid' , :class_name => 'Game'
	#has_many :games_as_black_uid, :foreign_key =>'black_uid' , :class_name => 'Game'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def games
  	Game.where(Game.arel_table[:white_uid].eq(self.id).or(Game.arel_table[:black_uid].eq(self.id)))
  end


end
