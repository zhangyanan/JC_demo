class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :state
  belongs_to :role
end
