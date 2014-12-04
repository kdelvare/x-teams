class CreateJoinTableMutantTeam < ActiveRecord::Migration
  def change
    create_join_table :mutants, :teams
  end
end
