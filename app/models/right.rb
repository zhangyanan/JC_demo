#encoding:utf-8
class Right < ActiveRecord::Base
  attr_accessible :description, :id, :name, :state
  include CommonActiveRecord
  has_many :role_rights
  has_many :roles, :through => :role_rights
  has_one :menu

  def self.all_names
    self.all.collect{|right|[right.name,right.id]}
  end


end
