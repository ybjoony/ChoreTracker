class Chore < ActiveRecord::Base
  attr_accessible :child_id, :completed, :due_on, :task_id
  
end
