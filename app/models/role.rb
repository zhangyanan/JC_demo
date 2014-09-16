class Role < ActiveRecord::Base
  attr_accessible :description, :id, :name
  include CommonActiveRecord
  has_many :role_users
  has_many :users, :through => :role_users
  has_many :role_rights
  has_many :rights, :through => :role_rights


  def enabled?
    self.state == ENABLED
  end

  def disabled?
    self.state == DISABLED
  end

  def used?
    !users.empty?
  end

  def has_right? name
    self.rights.collect{|role|[role.name]}.include?(name)
  end
end
