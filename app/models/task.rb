class Task < ActiveRecord::Base
  belongs_to :project
  attr_accessible :creator, :description, :id, :name, :operation, :state
end
