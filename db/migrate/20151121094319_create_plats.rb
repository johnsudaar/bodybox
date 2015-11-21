class CreatePlats < ActiveRecord::Migration
  def change
    create_table :plats do |t|
      t.string :nom
      t.timestamps null: false
    end
  end
end
