class AddPurpleCrystalsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :purple_crystals, :integer
  end
end
