class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|

    	t.integer :white_uid
    	t.integer :black_uid
    	t.string 	:game_name

      t.timestamps
    end
  end
end
