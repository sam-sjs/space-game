class AddSensorsInvestigatedToPlanets < ActiveRecord::Migration[5.2]
  def change
    add_column :planets, :sensors_investigated, :boolean
  end
end
