class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :insertion, null: false, foreign_key: true
      t.string :question, default: ""
      t.string :reply, default: ""

      t.timestamps
    end
  end
end
