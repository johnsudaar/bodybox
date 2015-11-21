class Mtm < ActiveRecord::Migration
  def self.up
    create_table 'ingredients_plats', :id => false do |t|
      t.column :ingredient_id, :integer
      t.column :plat_id, :integer
    end
  end
end
