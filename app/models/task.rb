class Task < ActiveRecord::Base
  belongs_to :project,:counter_cache => true
  attr_accessible :creator, :description, :id, :name, :operation, :state,:project_id
end
