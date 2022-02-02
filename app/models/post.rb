class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :parent, dependent: :destroy

  validates :body, presence: true

  def child_count
    0
  end
end
