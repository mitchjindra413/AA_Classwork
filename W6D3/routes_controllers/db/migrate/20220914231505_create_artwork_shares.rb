class CreateArtworkShares < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.references :artwork, null: false, index: {unique: true}, foreign_key: true
      t.references :viewer, index: {unique: true}, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
