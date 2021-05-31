class AddLikeCountToPhotos < ActiveRecord::Migration[6.1]
  def change
    add_column :photos, :like_count, :integer, default: 0
    add_column :albums, :like_count, :integer, default: 0
  end
end
