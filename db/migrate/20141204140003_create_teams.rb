class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.datetime :disbanded_at

      t.timestamps
    end
  end
end
