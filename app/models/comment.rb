class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def increment_post_comments_counter
    post.comments_counter += 1
    post.save
  end
end
