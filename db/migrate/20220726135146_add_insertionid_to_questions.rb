class AddInsertionidToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :insertion_id, :string
  end
end
