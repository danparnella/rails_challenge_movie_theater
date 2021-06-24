class AddCcSecurityCodeToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :cc_security_code, :string
  end
end
