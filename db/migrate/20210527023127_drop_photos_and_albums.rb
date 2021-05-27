class DropPhotosAndAlbums < ActiveRecord::Migration[6.1]
  def change
  	drop_table :photos
  	drop_table :albums

  	create_table :photos do |t|
      t.references :entity, polymorphic: true
      t.string :title
      t.text :description
      t.belongs_to :user
      t.integer :sharing_mode, default: 0

      t.timestamps
  	end

  	create_table :albums do |t|
      t.references :entity, polymorphic: true
  		t.string :title
    	t.text :description
    	t.integer :sharing_mode, default: 0
    	
    	t.timestamps
  	end
  end
end
