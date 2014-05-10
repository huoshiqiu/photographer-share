class AddDescritionToPhotos < ActiveRecord::Migration
  def up
    add_column :photos, :description, :string
  end

  def down
    remove_column :photos, :description, :string
  end
end
