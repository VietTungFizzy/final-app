class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
    	t.string :title
    	t.text :description
    	t.string :link_photo
    	t.belongs_to :user
    	t.integer :sharing_mode, default: 0

      	t.timestamps
    end
  end
end
