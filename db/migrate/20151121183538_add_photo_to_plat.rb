class AddPhotoToPlat < ActiveRecord::Migration
  def change
    add_column :plats, :photo, :string
  end
end
