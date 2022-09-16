# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :bigint           not null
#  viewer_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord
    validates :artwork_id, presence: true
    validates :viewer_id, presence: true
    validate :no_dupes

    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork

    belongs_to :viewer,
        foreign_key: :viewer_id,
        class_name: :User

    def no_dupes
        shares = ArtworkShare
        .select("artwork_id")
        .where("viewer_id = (?)", self.viewer_id)
        .pluck("artwork_id")
        if shares.include?(self.artwork_id)
            errors.add(:artwork_id, "duplicate")
        end
    end
end
