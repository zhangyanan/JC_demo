#encoding:utf-8
class Department < ActiveRecord::Base
  attr_accessible :id, :name, :state, :parent_id

  #belongs_to :parent,:class_name => 'Department',:foreign_key => 'parent_id'
  #belongs_to :children,:class_name => 'Department',:foreign_key => 'parent_id'


  def parent
    Department.find(self.parent_id).name
  end

  def children
    where("parent_id = ?",self.id)
  end
end
