#encoding:utf-8
class Record < ActiveRecord::Base
  attr_accessible :id, :in_out, :terminal_ip

  include CommonActiveRecord

  belongs_to :card
  belongs_to :terminal

  ONTIME = 0
  LATE = 1
  ONLEAVE = 2

  def in_out_text
    case self.in_out.to_i
      when 1
        '上班'
      when 2
        '下班'
    end
  end

  def work_state
    case self.created_at
      when created_at < DateTime.current
        '正常上班'
        When created_at > DateTime.new
        '迟到'
        When created_at == ''
        '请假'
    end
  end
end
