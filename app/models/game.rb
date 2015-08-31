class Game < ActiveRecord::Base
  has_many :pieces

  belongs_to :white_user, class_name: 'User', foreign_key: 'white_uid'
  belongs_to :black_user, class_name: 'User', foreign_key: 'black_uid'

end
