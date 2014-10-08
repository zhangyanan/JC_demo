#encoding:utf-8
class Department < ActiveRecord::Base
  include CommonActiveRecord
  attr_accessible :id, :name, :state, :parent_id
  has_many :employees

  #belongs_to :parent,:class_name => 'Department',:foreign_key => 'parent_id'
  #belongs_to :children,:class_name => 'Department',:foreign_key => 'parent_id'


  def parent
    Department.find(self.parent_id).name
  end

  def has_children?
    Department.where("parent_id = ?",self.id).count >=1
  end

  def has_employees?
    self.employees >=1
  end
end
