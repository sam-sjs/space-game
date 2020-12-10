class AddLastSystemToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_system, :integer
  end
end
