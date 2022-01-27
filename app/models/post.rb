class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :has_comment, dependent: :destroy

  validates :body, presence: true

  def post
    self
  end

  def parent
    false
  end

  def child_count
    return 0 if comments.empty?

    comments.count + comments.map(&:child_count).sum
  end
end
