class Task < ActiveRecord::Base
  attr_accessible :description, :list_id, :date, :date_american
  belongs_to :list

  scope :active, where(:alive => true)
  scope :inactive, where(:alive => false)

  after_initialize :set_date!

  def deactivate!
    update_attributes(:alive => false)
  end

  def date_american=(date)
    self.date = Date.strptime(date, '%m-%d-%Y')
  end

  def date_american
    self.date.strftime('%m-%d-%Y')
  end

  private
  def set_date!
    self.date ||= Date.today
  end
end
