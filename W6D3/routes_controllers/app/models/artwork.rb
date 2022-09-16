# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :image_url, presence: true, uniqueness: true
    validates :title, presence: true
    validates :artist_id, presence: true
    validate :no_dupes

    def no_dupes
        artist_works = Artwork
        .select("title")
        .where("artist_id = (?)", self.artist_id)
        .pluck(:title)
        if artist_works.include?(self.title)
            errors.add(:title, "duplicate")
        end
    end

    def self.artworks_for_user_id(id)
        Artwork
        .select("*")
        .joins(:artwork_shares)
        .where("artworks.artist_id = (?) OR artwork_shares.viewer_id = (?)", id, id)
    end


    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare,
        dependent: :destroy,
        inverse_of: :artwork

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

    has_many :comments,
        foreign_key: :artwork_id,
        class_name: :Comment,
        dependent: :destroy,
        inverse_of: :artwork


end
