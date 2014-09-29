class Employee < ActiveRecord::Base
  attr_accessible :birthday, :code, :department_id, :expired_at, :id, :name, :remark, :sex, :state

  MALE = 1 #男
  FEMALE = 0 #女
end
