require 'simplecov'
SimpleCov.start 'rails'
ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- but we don't want them anyways, so comment them out...
  # fixtures :all  

  # Add more helper methods to be used by all tests here...
  def deny(condition)
    # a simple transformation to increase readability IMO
    assert !condition
  end
  
  def create_child_context
    @alex = FactoryGirl.create(:child)
    @mark = FactoryGirl.create(:child, :first_name => "Mark")
    @rachel = FactoryGirl.create(:child, :first_name => "Rachel", :active => false)
  end
  
  def remove_child_context
    @alex.destroy
    @mark.destroy
    @rachel.destroy
  end
  
  def create_task_context
    @dishes = FactoryGirl.create(:task)
    @mow = FactoryGirl.create(:task, :name => "Mow grass", :points => 2)
    @wood = FactoryGirl.create(:task, :name => "Stack wood", :active => false)
    @sweep = FactoryGirl.create(:task, :name => "Sweep floor")
    @shovel = FactoryGirl.create(:task, :name => "Shovel driveway", :points => 3)
  end
  
  def remove_task_context
    @dishes.destroy
    @mow.destroy
    @wood.destroy
    @sweep.destroy
    @shovel.destroy
  end
  
  def create_chore_context
    @ac1 = FactoryGirl.create(:chore, :child => @alex, :task => @dishes)
    @mc1 = FactoryGirl.create(:chore, :child => @mark, :task => @sweep)
    @ac2 = FactoryGirl.create(:chore, :child => @alex, :task => @sweep, :due_on => 2.days.from_now.to_date)
    @mc2 = FactoryGirl.create(:chore, :child => @mark, :task => @dishes, :due_on => 2.days.from_now.to_date)
    @ac3 = FactoryGirl.create(:chore, :child => @alex, :task => @shovel, :due_on => 2.days.ago.to_date, :completed => true)
    @ac4 = FactoryGirl.create(:chore, :child => @alex, :task => @dishes, :due_on => Date.today)
    @mc3 = FactoryGirl.create(:chore, :child => @mark, :task => @sweep, :due_on => Date.today, :completed => true)
  end
  
  def remove_chore_context
    @ac1.destroy
    @ac2.destroy
    @ac3.destroy
    @ac4.destroy
    @mc1.destroy
    @mc2.destroy
    @mc3.destroy
  end
end
