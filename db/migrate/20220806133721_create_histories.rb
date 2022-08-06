class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
      t.references :insertion, null: false, foreign_key: true
      t.references :seller, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.string :place

      t.timestamps
    end
  end
end
