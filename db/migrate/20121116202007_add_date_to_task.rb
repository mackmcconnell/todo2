class AddDateToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :date
  end
end
