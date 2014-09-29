class Record < ActiveRecord::Base
  attr_accessible :id, :in_out, :terminal_id
end
