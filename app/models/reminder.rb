class Reminder < ActiveRecord::Base
  attr_accessible :task_id, :time
  belongs_to :task
  
  
end
