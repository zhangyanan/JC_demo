class Overtime < ActiveRecord::Base
  attr_accessible :description, :employee_id, :end_time, :id, :start_time
end
