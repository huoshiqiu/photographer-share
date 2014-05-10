class User < ActiveRecord::Base
  paginates_per 20
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :ensure_auth_token

  has_many :photos
  has_many :comments
  accepts_nested_attributes_for :photos, allow_destroy: true

  # relationship
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  has_many :reverse_relationships, foreign_key: "followed_id",
                                    class_name:  "Relationship",
                                    dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  # favourite
  has_many :favourites, dependent: :destroy
  has_many :favourite_photos, through: :favourites, source: :photo
  has_many :received_favourites, through: :photos, source: :favourites

  # counter :received_favourites_count

  def following?(other_user)
    relationships.where(followed_id: other_user.id).first
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.where(followed_id: other_user.id).first.destroy
  end

  def favourite?(photo)
    favourites.where(photo_id: photo.id).first
  end

  def favourite!(photo)
    favourites.create!(photo_id: photo.id)
  end

  def unfavourite(photo)
    favourites.where(photo_id: photo.id).first.destroy
  end

  def ensure_auth_token
    if auth_token.blank?
      self.auth_token = generate_auth_token
    end
  end

  def generate_auth_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(auth_token: token).first
    end
  end

  def feed
    # This is preliminary. See "Following customers" for the full implementation.
    Photo.from_users_followed_by(self)
  end

end
