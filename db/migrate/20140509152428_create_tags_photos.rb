class CreateTagsPhotos < ActiveRecord::Migration
  def change
    create_table :photos_tags do |t|
      t.references :tag, index: true
      t.references :photo, index: true
    end
  end
end
