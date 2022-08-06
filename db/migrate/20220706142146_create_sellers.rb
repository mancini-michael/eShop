class CreateSellers < ActiveRecord::Migration[7.0]
  def change
    create_table :sellers do |t|
      t.references :user, null: false, foreign_key: { on_cascade: :delete }, index: { unique: true }
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
