class Terminal < ActiveRecord::Base
  attr_accessible :id, :name, :remote_id, :state
  include CommonActiveRecord

  has_many :records
end
