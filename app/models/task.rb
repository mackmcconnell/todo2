class Task < ActiveRecord::Base
  attr_accessible :description, :list_id, :date
  belongs_to :list

  scope :active, where(:alive => true)
  scope :inactive, where(:alive => false)

  def deactivate!
    update_attributes(:alive => false)
  end
end
