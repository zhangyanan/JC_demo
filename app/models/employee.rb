class Employee < ActiveRecord::Base
  attr_accessible :birthday, :code, :department_id, :expired_at, :id, :name, :remark, :sex, :state

  MALE = 1
  FEMALE = 0
end
