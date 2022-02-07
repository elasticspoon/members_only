class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :parent, dependent: :destroy

  validates :body, presence: true

  def self.posts_with_comment_count
    Post.select('posts.*, (SELECT COUNT(comments.id) FROM comments WHERE comments.post_id = posts.id) AS comment_count')
        .joins(:user).order('created_at DESC')
  end
end
