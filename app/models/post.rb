class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true, length: { maximum: 5000 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :increment_user_posts_count

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def increment_user_posts_count
    user.increment!(:posts_counter)
  end
end
