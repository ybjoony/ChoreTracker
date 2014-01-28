require 'test_helper'

class ChildTest < ActiveSupport::TestCase
  should have_many(:chores)
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  
  context "Creating three children" do
    setup do
      create_child_context
    end
    
    teardown do
      remove_child_context
    end
    
    should "have name methods that list first_ and last_names combined" do
      assert_equal "Alex Heimann", @alex.name
      assert_equal "Mark Heimann", @mark.name
      assert_equal "Rachel Heimann", @rachel.name
    end
    
    should "have a scope to alphabetize children" do
      assert_equal ["Alex", "Mark", "Rachel"], Child.alphabetical.map{|c| c.first_name}
    end
    
    should "have a scope to select only active children" do
      assert_equal ["Alex", "Mark"], Child.active.alphabetical.map{|c| c.first_name}
    end
  end
end
