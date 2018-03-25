class AddStateToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :state, :string
  end
end
