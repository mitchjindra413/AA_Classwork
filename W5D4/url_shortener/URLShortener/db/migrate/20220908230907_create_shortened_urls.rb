class CreateShortenedUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url, null: false 
      t.string :short_url, null: false 
      t.bigint :user_id, null: false
      t.timestamps
    end
    add_index :shortened_urls, :long_url 
    add_index :shortened_urls, :short_url, unique: true 
    add_index :shortened_urls, :user_id, unique: true 
  end
end
