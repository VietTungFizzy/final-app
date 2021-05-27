class CreateLikes < ActiveRecord::Migration[6.1]
  def change
  	remove_index :photos, column: [:entity_type, :entity_id]
  	remove_index :albums, column: [:entity_type, :entity_id]
  	remove_column :photos, :entity_type
  	remove_column :photos, :entity_id
  	remove_column :albums, :entity_type
  	remove_column :albums, :entity_id
  	
    create_table :likes do |t|
		t.integer :liked_on_id
		t.string :liked_on_type
		t.references :user

		t.timestamps
    end

    add_index :likes, [:liked_on_type, :liked_on_id]
  end
end
