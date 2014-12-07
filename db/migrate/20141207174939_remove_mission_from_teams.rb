class RemoveMissionFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :mission
  end
end
