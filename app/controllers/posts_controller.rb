class PostsController < ApplicationController
  before_action :find_post, only: %i[destroy edit show update]
  before_action :authenticate_user!, except: %i[index show]
  before_action :create_comment, only: :show
  def index
    @posts = Post.posts_with_comment_count

    @post = Post.new
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post edited succesfully!'
    else
      render action: 'edit', status: :unprocessable_entity
    end
  end

  def show; end

  def destroy
    @post.destroy
    redirect_to root_path, notice: 'Post was succesfully deleted.'
  end

  def create
    @posts = Post.posts_with_comment_count

    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: 'Post created succesfully!'
    else
      render action: 'index', status: :unprocessable_entity
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body)
  end

  def create_comment
    @new_comment = @post.comments.build(post_id: @post.id) if user_signed_in?
  end
end
