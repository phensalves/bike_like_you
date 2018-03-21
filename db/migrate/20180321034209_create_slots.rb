class CreateSlots < ActiveRecord::Migration[5.1]
  def change
    create_table :slots do |t|
      t.references :station, foreign_key: true
      t.boolean :available

      t.timestamps
    end
  end
end
