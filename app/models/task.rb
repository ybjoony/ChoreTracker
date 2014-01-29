class Task < ActiveRecord::Base
  attr_accessible :active, :name, :points
  scope :alphabetical, order('name')
  scope :active, where('active = ?', true)
  has_many :chores
  validates_presence_of :name
  validates_numericality_of :points , :only_integer => true, :greater_than_or_equal_to => 0
end
