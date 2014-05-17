class Photo < ActiveRecord::Base
  mount_uploader :image_uid, PhotoUploader

  has_and_belongs_to_many :tags
  belongs_to :user
  has_many :comments
  has_many :favourites, dependent: :destroy
  has_many :favourited_by_users, through: :favourites, source: :user

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end

  # def self.increment_score
  #   increment(:score)
  # end

  # def self.decrement_score
  #   decrement(:score)
  # end

end
