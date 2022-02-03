class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :parent, dependent: :destroy

  validates :body, presence: true
end
