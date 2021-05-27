class RemoveLinkPhotosFromPhotos < ActiveRecord::Migration[6.1]
  def change
  	remove_column :photos, :link_photo, :string
  end
end
