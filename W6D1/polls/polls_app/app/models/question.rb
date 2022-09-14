# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  poll_id    :bigint           not null
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Question < ApplicationRecord
    has_many :answer_choices,
        foreign_key: :question_id,
        class_name: :Answerchoice,
        dependent: :destroy

    belongs_to :poll,
        foreign_key: :poll_id,
        class_name: :Poll

    has_many :responses,
        through: :answer_choices,
        source: :responses
end
