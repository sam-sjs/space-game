class AddGreenCrystalsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :green_crystals, :integer
  end
end
