class AddScoreToPhotos < ActiveRecord::Migration
  def up
    add_column :photos, :score, :integer, default: 0
  end

  def down
    remove_column :photos, :score, :integer, default: 0
  end
end
