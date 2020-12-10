class AddMineTimeToPlanets < ActiveRecord::Migration[5.2]
  def change
    add_column :planets, :mine_time, :datetime
  end
end
