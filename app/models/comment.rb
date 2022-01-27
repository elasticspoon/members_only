class Comment < ApplicationRecord
  belongs_to :has_comment, polymorphic: true
  belongs_to :user

  has_many :comments, as: :has_comment, dependent: :destroy

  validates :has_comment_id, presence: true
  validates :user_id, presence: true
  validates :body, presence: true 

  def parent
    has_comment
  end

  def post
    return parent.post if parent

    self
  end

  def root
    return parent.root if parent.is_a?(Comment)

    self
  end

  def child_count
    return 0 if comments.empty?

    comments.count + comments.map(&:child_count).sum
  end
end
