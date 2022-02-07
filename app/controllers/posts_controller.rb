class PostsController < ApplicationController
  before_action :find_post, only: %i[destroy edit show update]
  before_action :authenticate_user!, except: %i[index show]
  # before_action :check_permitted_user, only: :show

  def index
    @posts = Post.posts_with_comment_count

    @post = Post.new
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Post edited succesfully!'
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

    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to post_path(@post), notice: 'Post created succesfully!'
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

  # def check_permitted_user
  #  @new_comment = @post.comments.build(user_id: current_user.id) if user_signed_in?
  # end
end
