class AddLastsigninipToOauths < ActiveRecord::Migration[7.0]
  def change
    add_column :oauths, :last_sign_in_ip, :string
  end
end
