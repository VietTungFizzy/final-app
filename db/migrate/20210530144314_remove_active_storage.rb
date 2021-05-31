class RemoveActiveStorage < ActiveRecord::Migration[6.1]
  def change
    drop_table :active_storage_attachments
    drop_table :active_storage_variant_records
    drop_table :active_storage_blobs
    add_column :photos, :image, :string
    add_column :albums, :images, :string
    add_column :users, :image, :string

  end
end
