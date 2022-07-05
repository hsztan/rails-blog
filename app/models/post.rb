class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def increment_user_posts_count
    user.posts_counter += 1
    user.save
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
