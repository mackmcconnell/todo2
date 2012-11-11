class Task < ActiveRecord::Base
  attr_accessible :description, :list_id
  belongs_to :list
end
