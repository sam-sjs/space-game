class AddRedCrystalsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :red_crystals, :integer
  end
end
