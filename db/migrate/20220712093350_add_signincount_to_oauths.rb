class AddSignincountToOauths < ActiveRecord::Migration[7.0]
  def change
    add_column :oauths, :sign_in_count, :integer
  end
end
