class Child < ActiveRecord::Base
  attr_accessible :active, :first_name, :last_name
  has_many :chores
  validates_presence_of :first_name
  validates_presence_of :last_name
  
end
