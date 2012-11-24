class Reminder < ActiveRecord::Base
  attr_accessible :task_id, :time, :date
  belongs_to :task
  after_create :send_sms


  def send_sms
    @task = Reminder.last.task
    RemindersWorker.perform_async(@task.id)
  end
end
