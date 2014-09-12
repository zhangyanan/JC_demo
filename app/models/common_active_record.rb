#encoding:utf-8
module CommonActiveRecord
#  state
  ENABLED = 1
  DISABLED = 0

  def state_text
    case self.state
      when ENABLED
        '可用'
      when DISABLED
        '禁用'
    end
  end
end