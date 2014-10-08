class Terminal < ActiveRecord::Base
  attr_accessible :id, :name, :remote_ip, :state
  include CommonActiveRecord

  has_many :records
end
