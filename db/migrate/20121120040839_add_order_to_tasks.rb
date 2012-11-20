class AddOrderToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :order, :int
  end
end
