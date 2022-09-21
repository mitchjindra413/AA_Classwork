# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  band_id    :integer          not null
#  studio     :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
    validates :title, presence: true
    validates :title, presence: true
    validates :year, presence: true
    validates :title, uniqueness: {scope: :band_id}
    validates :studio, inclusion: {in: [true, false]}

    belongs_to :band

end
