class AddAlbumToPhotos < ActiveRecord::Migration[6.1]
  def change
    add_reference :photos, :album, index: true
  end
end
