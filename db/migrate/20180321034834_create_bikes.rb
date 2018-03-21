class CreateBikes < ActiveRecord::Migration[5.1]
  def change
    create_table :bikes do |t|
      t.string :brand
      t.string :model
      t.references :station, foreign_key: true

      t.timestamps
    end
  end
end
