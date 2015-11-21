class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :nom
      t.string :categorie

      t.timestamps null: false
    end
  end
end
