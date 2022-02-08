class Comment < ApplicationRecord
  belongs_to :parent, polymorphic: true
  belongs_to :user
  belongs_to :post

  has_many :comments, as: :parent, dependent: :destroy

  validates :parent_id, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :body, presence: true

  def root?
    parent == post
  end

  def path_parent
    root? ? parent : [post, parent]
  end

  def path_self
    [post, self]
  end

  def self.create_new_comment(request)
    url_vars = request.path.split('/')
    resource, id = url_vars[4] ? url_vars[3, 4] : url_vars[1, 2]
    parent = resource.singularize.classify.constantize.find(id)
    parent.comments.build(post_id: parent.post_id)
  end
end
