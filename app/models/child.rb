class Child < ActiveRecord::Base
  attr_accessible :active, :first_name, :last_name
  scope :alphabetical, order('last_name', 'first_name')
  scope :active, where('active = ?', true)
  has_many :chores
  validates_presence_of :first_name
  validates_presence_of :last_name
   def name
    "#{first_name} #{last_name}"
  end
end
