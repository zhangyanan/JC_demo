#encoding:utf-8
class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :state

  mount_uploader :avatar, ImageUploader
  has_many :role_users
  has_many :roles, through: :role_users
#  user state
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
