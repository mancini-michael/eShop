class AddActiveStatusToSeller < ActiveRecord::Migration[7.0]
  def change
    add_column :sellers, :active, :boolean, null: false, default: true
  end
end
