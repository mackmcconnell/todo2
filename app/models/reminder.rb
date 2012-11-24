class Reminder < ActiveRecord::Base
  attr_accessible :task_id, :time, :date
  belongs_to :task


end
