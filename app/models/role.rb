class Role < ActiveRecord::Base
  attr_accessible :description, :id, :name
  include CommonActiveRecord
  has_many :role_users
  has_many :users, :through => :role_users
  has_many :role_rights
  has_many :rights, :through => :role_rights

  attr_accessible :name,:description,:state

  accepts_nested_attributes_for :rights

  def enabled?
    self.state == ENABLED
  end

  def disabled?
    self.state == DISABLED
  end

  def used?
    !users.empty?
  end

  def has_right? id
    !self.role_rights.where(right_id: id).blank?
  end
end
