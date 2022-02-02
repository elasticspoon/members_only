class Comment < ApplicationRecord
  belongs_to :parent, polymorphic: true
  belongs_to :user
  belongs_to :post

  has_many :comments, as: :parent, dependent: :destroy

  validates :parent_id, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :body, presence: true

  def child_count
    # return 0 if comments.empty?

    # comments.count + comments.map(&:child_count).sum
    0
  end
end
