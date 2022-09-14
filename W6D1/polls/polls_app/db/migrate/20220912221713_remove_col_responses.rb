class RemoveColResponses < ActiveRecord::Migration[7.0]
  def change
    remove_column :responses, :question_id
    add_column :responses, :answer_choice_id, :bigint
    add_index :responses, :answer_choice_id
    add_foreign_key :responses, :answerchoices, column: :answer_choice_id
  end
end
