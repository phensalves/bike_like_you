class AddBikeReferenceToSlots < ActiveRecord::Migration[5.1]
  def change
    add_reference :slots, :bike, foreign_key: true
  end
end
