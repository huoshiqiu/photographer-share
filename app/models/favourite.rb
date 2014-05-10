class Favourite < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo

  validates :user_id, :photo_id, presence: true

  after_create :increment_photo_score
  after_destroy :decrement_photo_score

  def increment_photo_score
    photo.increment(:score)
    photo.save
  end

  def decrement_photo_score
    photo.decrement(:score)
    photo.save
  end

  # after_create do
  #   photo.user.received_favourites_count.increment
  # end

  # after_destroy do
  #   photo.user.received_favourites_count.decrement
  # end
end
