class RemoveIndexFromUserIdFromShortenedUrl < ActiveRecord::Migration[7.0]
  def change
    remove_index :shortened_urls, column: :user_id
  end
end
