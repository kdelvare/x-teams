class MakeNameUniqueInMutants < ActiveRecord::Migration
  def change
    add_index :mutants, :name, :unique => true
  end
end
