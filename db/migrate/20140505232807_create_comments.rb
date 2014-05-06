class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, default: ''
      t.references :user
      t.references :photo

      t.timestamps

      t.index([:user_id, :photo_id], unique: true )
    end
  end
end
