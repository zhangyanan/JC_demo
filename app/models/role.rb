class Role < ActiveRecord::Base
  attr_accessible :description, :id, :name
  has_many :user
end
