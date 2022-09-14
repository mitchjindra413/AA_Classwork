# == Schema Information
#
# Table name: answerchoices
#
#  id          :bigint           not null, primary key
#  question_id :bigint           not null
#  text        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Answerchoice < ApplicationRecord
    belongs_to :question,
        foreign_key: :question_id,
        class_name: :Question

    has_many :responses,
        foreign_key: :answer_choice_id,
        class_name: :Response,
        dependent: :destroy
end
