class CreateSystems < ActiveRecord::Migration[5.2]
  def change
    create_table :systems do |t|
      t.string :name
      t.integer :planets
      t.text :image
      t.integer :user_id
      t.integer :sys_below_id
      t.integer :sys_above_id
      t.integer :sys_left_id
      t.integer :sys_right_id

      t.timestamps
    end
  end
end
