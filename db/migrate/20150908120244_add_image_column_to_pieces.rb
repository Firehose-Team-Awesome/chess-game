class AddImageColumnToPieces < ActiveRecord::Migration
  def change
  	add_column :pieces, :image, :string 
  end
end
