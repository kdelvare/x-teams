class AddMissionToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :mission, :text
  end
end
