class CreatePolls < ActiveRecord::Migration[7.0]
  def change
    create_table :polls do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.timestamps
    end
  end
end
