class RemovePlanetsFromSystems < ActiveRecord::Migration[5.2]
  def change
    remove_column :systems, :planets
  end
end
