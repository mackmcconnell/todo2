class ChangeAliveToBoolean < ActiveRecord::Migration
  def up
    change_column :tasks, :alive, :boolean, :default => true, :null => false
    add_index :tasks, :alive
  end

  def down
    add_column :tasks, :alive, :string
    drop_index :tasks, :alive
  end
end
