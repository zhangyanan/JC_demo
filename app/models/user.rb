class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :state

  mount_uploader :avatar, ImageUploader
  has_many :role_users
  has_many :roles, through: :role_users
end
