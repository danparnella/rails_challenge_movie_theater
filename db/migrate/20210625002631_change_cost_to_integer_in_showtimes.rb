class ChangeCostToIntegerInShowtimes < ActiveRecord::Migration[6.1]
  def up
    change_column :showtimes, :cost, :integer
  end
  def down
    change_column :showtimes, :cost, :float
  end
end
