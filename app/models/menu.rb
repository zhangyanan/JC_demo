class Menu < ActiveRecord::Base
  attr_accessible :id, :name, :parent_menu_id, :url, :right_id
  include CommonActiveRecord
  belongs_to :right
  belongs_to :parent,:class_name => "Menu",:foreign_key => "parent_menu_id"

  def self.root
    Menu.find 1
  end

  def self.root_menu
    where(parent_menu_id: nil).order("id").all
  end

  def children
    Menu.all :conditions => ['parent_menu_id = ?', self.id]
  end

  def menu_right
    self.right.name
  end

  def parent_menu

  end

end