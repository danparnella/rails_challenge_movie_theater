class CreateShowtimes < ActiveRecord::Migration[6.1]
  def change
    create_table :showtimes do |t|
      t.datetime :date_time
      t.integer :tickets_available
      t.float :cost
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
