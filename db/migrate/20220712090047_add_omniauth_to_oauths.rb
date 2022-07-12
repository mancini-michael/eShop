class AddOmniauthToOauths < ActiveRecord::Migration[7.0]
  def change
    add_column :oauths, :provider, :string
    add_column :oauths, :uid, :string
  end
end
