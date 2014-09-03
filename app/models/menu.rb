class Menu < ActiveRecord::Base
  attr_accessible :id, :name, :parent_menu_id, :url,:right_id

  def self.root
    Menu.find 1
  end

  def children
    Menu.all :conditions => ['parent_menu_id = ?', self.id]
  end
end