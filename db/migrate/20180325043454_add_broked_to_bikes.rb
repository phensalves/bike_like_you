class AddBrokedToBikes < ActiveRecord::Migration[5.1]
  def change
    add_column :bikes, :broked, :boolean
  end
end
