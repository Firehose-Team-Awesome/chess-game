class User < ActiveRecord::Base
	has_many :games_as_white_uid, :foreign_key =>'white_uid' , :class_name => 'Game'
	has_many :games_as_black_uid, :foreign_key =>'black_uid' , :class_name => 'Game'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def games
  	games_as_white_uid + games_as_black_uid
  end


end
