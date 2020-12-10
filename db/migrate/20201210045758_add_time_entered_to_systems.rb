class AddTimeEnteredToSystems < ActiveRecord::Migration[5.2]
  def change
    add_column :systems, :time_entered, :datetime
  end
end
