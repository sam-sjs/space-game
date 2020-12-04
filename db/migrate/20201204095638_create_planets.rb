class CreatePlanets < ActiveRecord::Migration[5.2]
  def change
    create_table :planets do |t|
      t.string :name
      t.integer :size
      t.boolean :fuel_present
      t.boolean :fuel_constructed
      t.text :image
      t.integer :system_id

      t.timestamps
    end
  end
end
