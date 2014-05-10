class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.integer :user_id
      t.integer :photo_id

      t.timestamps
    end

    add_index :favourites , :user_id
    add_index :favourites , :photo_id
    add_index :favourites , [:user_id, :photo_id], unique: true
  end
end
