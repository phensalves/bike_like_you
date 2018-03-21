class AddBikeReferenceToTrips < ActiveRecord::Migration[5.1]
  def change
    add_reference :trips, :bike, foreign_key: true
  end
end
