class Terminal < ActiveRecord::Base
  attr_accessible :id, :name, :remote_id, :state
end
