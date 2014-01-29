class Chore < ActiveRecord::Base
  attr_accessible :child_id, :completed, :due_on, :task_id
  belongs_to :child
  belongs_to :task
  scope :done, where('completed == ?', true)
  scope :pending, where('completed == ?', false)
  scope :by_task, joins(:task).order('tasks.name')
  scope :upcoming, where('due_on >= ?', Date.today)
  scope :past, where('due_on < ?', Date.today)
  scope :chronological, order("due_on asc")
  validates_date :due_on

  def status
  	if completed?
  		return "Completed"
  		else return "Pending"
  	end
  end
end
