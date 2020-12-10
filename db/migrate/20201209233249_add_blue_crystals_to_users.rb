class AddBlueCrystalsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :blue_crystals, :integer
  end
end
