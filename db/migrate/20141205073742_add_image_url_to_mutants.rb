class AddImageUrlToMutants < ActiveRecord::Migration
  def change
    add_column :mutants, :image_url, :text
  end
end
