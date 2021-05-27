class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
  	drop_table :albums_photos
    create_table :relationships do |t|    	
		t.integer :follower_id
		t.integer :followed_id
    end
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end
