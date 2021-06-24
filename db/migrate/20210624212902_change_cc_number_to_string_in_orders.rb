class ChangeCcNumberToStringInOrders < ActiveRecord::Migration[6.1]
  def up
    change_column :orders, :cc_number, :string
  end

  def down
    change_column :orders, :cc_number, :integer
  end
end
