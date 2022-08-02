class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.references :insertion, null: false, foreign_key: true
      t.references :seller, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :date
      t.string :place

      t.timestamps
    end
  end
end
