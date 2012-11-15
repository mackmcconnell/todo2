class AddAliveColumnToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :alive, :string
  end
end
