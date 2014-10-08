#encoding:utf-8
class User < ActiveRecord::Base
  include CommonActiveRecord
  attr_accessible :email, :name, :password, :state

  mount_uploader :avatar, ImageUploader
  has_many :role_users
  has_many :roles, through: :role_users
  has_many :projects
  has_one :card


  attr_accessible :name,:description,:state

  def role_name
    self.roles.collect{|role| role.name}.first
  end


end
