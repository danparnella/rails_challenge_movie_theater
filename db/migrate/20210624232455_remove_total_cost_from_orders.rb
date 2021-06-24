class RemoveTotalCostFromOrders < ActiveRecord::Migration[6.1]
  def up
    remove_column :orders, :total_cost, :float
  end
  def down
    add_column :orders, :total_cost, :float
  end
end
