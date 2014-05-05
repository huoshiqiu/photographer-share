class Photo < ActiveRecord::Base
  mount_uploader :image_uid, PhotoUploader

  belongs_to :user
end
