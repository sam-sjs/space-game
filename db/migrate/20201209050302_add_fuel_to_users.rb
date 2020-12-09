class AddFuelToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fuel, :integer
  end
end
