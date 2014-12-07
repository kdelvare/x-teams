class AddTeamsRefToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :team, index: true
  end
end
