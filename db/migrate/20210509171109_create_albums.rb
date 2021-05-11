class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
    	t.string :title
    	t.text :description
    	t.integer :sharing_mode, default: 0
    	
      	t.timestamps
    end

    create_table :albums_photos, id: false do |t|
    	t.belongs_to :album
    	t.belongs_to :photo
	end
  end
end
