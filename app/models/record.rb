class Record < ActiveRecord::Base
  attr_accessible :id, :in_out, :terminal_ip

  include CommonActiveRecord

  belongs_to :card
  belongs_to :terminal
end
