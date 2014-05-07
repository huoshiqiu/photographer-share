class User < ActiveRecord::Base
  paginates_per 20
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :photos
  accepts_nested_attributes_for :photos, allow_destroy: true

  # relationship
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  has_many :reverse_relationships, foreign_key: "followed_id",
                                    class_name:  "Relationship",
                                    dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  def following?(other_user)
    relationships.where(followed_id: other_user.id).first
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.where(followed_id: other_user.id).first.destroy
  end

end
