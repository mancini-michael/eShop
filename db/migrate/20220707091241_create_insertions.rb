class CreateInsertions < ActiveRecord::Migration[7.0]
  def change
    create_table :insertions do |t|
      t.references :seller, null: false, foreign_key: { on_cascade: :delete }
      t.string :title, null: false, default: ""
      t.string :description, null: false, default: ""
      t.decimal :price, null: false, default: 0
      t.integer :categories, null: false, default: 0

      t.timestamps
    end
  end
end
