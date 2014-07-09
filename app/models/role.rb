class Role < ActiveRecord::Base
  attr_accessible :description, :id, :name
  has_many :user

#  role 状态:启用 禁用
  ENABLED = 1
  DISABLED = 0

  def enabled?
    self.state == ENABLED
  end

  def disabled?
    self.state == DISABLED
  end

  def used?
    !Role.find_by_user_id(user_id).empty?
  end

end
