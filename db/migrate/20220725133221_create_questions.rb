class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :seller_id
      t.string :question
      t.string :reply

      t.timestamps
    end
  end
end
