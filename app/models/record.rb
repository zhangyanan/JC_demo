class Record < ActiveRecord::Base
  attr_accessible :id, :in_out, :terminal_ip

  include CommonActiveRecord

  has_many :card_records
  has_many :cards,:through => :card_records
end
