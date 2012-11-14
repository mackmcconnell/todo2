class List < ActiveRecord::Base
  attr_accessible :title
  has_many :tasks
  validates_presence_of :title
end
