class Employee < ActiveRecord::Base
  attr_accessible :birthday, :code, :department_id, :expired_at, :id, :name, :remark, :sex, :state

  MALE = 1 #男
  FEMALE = 0 #女

  ONJOIB = 1 #在职
  OFFJOIB = 2 #离职
  AWAYJOIB = 3 #出差
  MATERNITYlEAVE = 4 #产假
  PATERNITYlEAVE = 5 #陪产假

end
