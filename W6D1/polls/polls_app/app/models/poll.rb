# == Schema Information
#
# Table name: polls
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Poll < ApplicationRecord
    belongs_to :author,
        foreign_key: :user_id,
        class_name: :User

    has_many :responses,
        foreign_key: :user_id,
        class_name: :Response,
        dependent: :destroy

    
end
