class AddDateToReminders < ActiveRecord::Migration
  def change
    add_column :reminders, :date, :date
  end
end
