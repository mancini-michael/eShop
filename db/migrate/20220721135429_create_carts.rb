class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: z
      t.references :insertion, null: false, foreign_key: z

      t.timestamps
    end
  end
end
