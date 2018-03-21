class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :origin_station
      t.string :final_station
      t.datetime :start_date
      t.datetime :end_date
      t.float :distance

      t.timestamps
    end
  end
end
