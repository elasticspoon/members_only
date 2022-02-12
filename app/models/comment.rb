class Comment < ApplicationRecord
  default_scope { order('created_at DESC') }

  belongs_to :parent, polymorphic: true
  belongs_to :user
  belongs_to :post, counter_cache: true

  has_many :comments, as: :parent, dependent: :destroy

  validates :parent_id, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :body, presence: true

  def root?
    parent_id == post_id && parent_type == 'Post'
  end

  def path_parent
    root? ? "/posts/#{parent_id}" : "/posts/#{post_id}/comments/#{parent_id}"
  end

  def path_self
    [post, self]
  end

  def self.create_new_comment(request)
    resource, id = request.path.split('/').last(2)
    parent = resource.singularize.classify.constantize.find(id)
    parent.comments.build(post_id: parent.post_id)
  end
end
