class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :state

  has_many :role_users
  has_many :roles, through: :role_users
end
