class Task < ActiveRecord::Base
  attr_accessible :description, :list_id, :date
  belongs_to :list

  scope :active, where(:alive => "yes")
  scope :inactive, where(:alive => "no")

end