class CardRecord < ActiveRecord::Base
  belongs_to :card
  belongs_to :record
end