class AddUserReferenceToAlbums < ActiveRecord::Migration[6.1]
  def change
  	add_reference :albums, :user, foreign_key: true
  end
end
