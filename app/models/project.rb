class Project < ActiveRecord::Base
  has_many :tasks
  belongs_to :project_creator,:class_name => 'User',:foreign_key => 'creator'
  belongs_to :user
  attr_accessible :creator, :description, :id, :name, :state,:group_id,:project_url
end
