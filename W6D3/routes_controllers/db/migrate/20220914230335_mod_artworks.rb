class ModArtworks < ActiveRecord::Migration[7.0]
  def change
    add_index :artworks, :image_url, unique: true
  end
end
