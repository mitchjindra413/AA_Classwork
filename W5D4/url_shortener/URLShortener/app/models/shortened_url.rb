require 'securerandom'
# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
    validates :long_url, presence: true
    validates :short_url, uniqueness: true 
    validates :user_id, presence: true

    def self.random_code
        short_url = SecureRandom.urlsafe_base64(16)
        while self.exists?(short_url)
            short_url = SecureRandom.urlsafe_base64(16)
        end
        short_url
    end

    # after_initialize do |short_url|
    #     before_save self.generate_short_url, if: self.long_url != nil 
    # end

    after_initialize :generate_short_url unless self.exists?(long_url)

    private 
    def generate_short_url
        if !(self.exists?(long_url))
            self.short_url = ShortenedUrl.random_code
            self.save!
        end
    end
end
