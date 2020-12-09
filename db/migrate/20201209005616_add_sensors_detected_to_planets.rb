class AddSensorsDetectedToPlanets < ActiveRecord::Migration[5.2]
  def change
    add_column :planets, :sensors_detected, :boolean
  end
end
