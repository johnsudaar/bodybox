class AddPrixToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :prix, :float
  end
end
