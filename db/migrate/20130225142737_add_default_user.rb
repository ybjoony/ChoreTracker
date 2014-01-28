class AddDefaultUser < ActiveRecord::Migration
  def up
    dad = User.new
    dad.username = "dad"
    dad.email = "dad@yipee.com"
    dad.password = "taskmaster"
    dad.password_confirmation = "taskmaster"
   	dad.save!  
  end

  def down
    dad = User.where("username = ?", "dad").first
    User.delete dad
  end
end
