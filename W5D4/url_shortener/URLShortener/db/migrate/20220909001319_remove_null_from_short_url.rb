class RemoveNullFromShortUrl < ActiveRecord::Migration[7.0]
  def change
    change_column_null :shortened_urls, :short_url, true
  end
end
