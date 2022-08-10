class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :insertion, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
