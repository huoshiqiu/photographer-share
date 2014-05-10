class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string   "image_uid"
      t.references :user

      t.timestamps
      t.index(:user_id)
    end
  end
end
