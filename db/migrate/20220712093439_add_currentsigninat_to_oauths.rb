class AddCurrentsigninatToOauths < ActiveRecord::Migration[7.0]
  def change
    add_column :oauths, :current_sign_in_at, :datetime
  end
end
