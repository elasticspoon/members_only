class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :parent, dependent: :destroy

  validates :body, presence: true

  def post_id
    id
  end

  def path_parent
    self
  end

  def path_self
    self
  end
end
