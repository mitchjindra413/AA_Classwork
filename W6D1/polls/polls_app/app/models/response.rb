# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  user_id          :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  answer_choice_id :bigint
#
class Response < ApplicationRecord
    validate :not_duplicate_response 

    belongs_to :respondent,
        foreign_key: :user_id,
        class_name: :User
    
    belongs_to :answer_choice,
        foreign_key: :answer_choice_id,
        class_name: :Answerchoice

    has_one :question,
        through: :answer_choice,
        source: :question

    def sibling_responses
        response.question.responses.where.not(responses: {id: :self.id})
    end

    def self.not_duplicate_response
        if 
    end
end
