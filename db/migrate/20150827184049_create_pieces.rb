class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|

    	t.integer :game_id
    	t.integer :pos_x
    	t.integer :pos_y
    	t.boolean	:active
    	t.string	:type
    	t.integer :color

      t.timestamps
    end
  end
end
