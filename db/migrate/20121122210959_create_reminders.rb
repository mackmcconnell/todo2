class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.integer :task_id
      t.time :time

      t.timestamps
    end
  end
end
