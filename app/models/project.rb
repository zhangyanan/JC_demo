class Project < ActiveRecord::Base
  has_many :tasks
  attr_accessible :creator, :description, :id, :name, :state
end
