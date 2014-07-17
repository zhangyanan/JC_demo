class Role < ActiveRecord::Base
  attr_accessible :description, :id, :name

  has_many :role_users
  has_many :users, :through => :role_users

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
    !users.empty?
  end
end
