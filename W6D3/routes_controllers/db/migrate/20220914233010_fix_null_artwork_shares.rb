class FixNullArtworkShares < ActiveRecord::Migration[7.0]
  def change
    change_column :artwork_shares, :viewer_id, :bigint, null: false
  end
end
