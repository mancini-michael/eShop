class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.references :insertion, null: false, foreign_key: { on_delete: :cascade }
      t.references :seller, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :date, null: false, default: DateTime.now
      t.string :place, null: false, default: ""
      t.boolean :user_approvation, null: false, default: true
      t.boolean :seller_approvation, null: false, default: false

      t.timestamps
    end
  end
end
