class List < ActiveRecord::Base
  attr_accessible :title
  has_many :tasks
  belongs_to :user
end
