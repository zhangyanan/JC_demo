#encoding:utf-8
class Employee < ActiveRecord::Base
  attr_accessible :birthday, :code, :department_id, :expired_at, :id, :name, :remark, :sex, :state

  belongs_to :department
  MALE = 1 #男
  FEMALE = 0 #女

  ONJOIB = 1 #在职
  OFFJOIB = 2 #离职
  AWAYJOIB = 3 #出差
  MATERNITYlEAVE = 4 #产假
  PATERNITYlEAVE = 5 #陪产假

  def state_text
    case self.state.to_i
      when  Employee::ONJOIB
        '在职'
      when  Employee::OFFJOIB
        '离职'
      when  Employee::AWAYJOIB
        '出差'
      when  Employee::MATERNITYlEAVE
        '产假'
      when  Employee::PATERNITYlEAVE
        '陪产假'
    end
  end

end
