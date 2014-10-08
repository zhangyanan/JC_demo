class Card < ActiveRecord::Base
  attr_accessible :card_number, :created_at, :employee_id, :id, :lost_at, :update_at

  belongs_to :employee
  has_many :records
end
