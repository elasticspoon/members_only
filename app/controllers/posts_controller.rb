class PostsController < ApplicationController
  before_action :find_post, only: %i[destroy edit show update]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @posts = Post.all.order('created_at DESC')
    @post = Post.new
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to root_path, notice: 'Post edited succesfully!'
    else
      flash.now[:alert] = @post.errors.full_messages
      render action: 'edit', status: :unprocessable_entity
    end
  end

  def show; end

  def destroy
    @post.destroy
    redirect_to root_path, notice: 'Post was succesfully deleted.'
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @posts = Post.all.order('created_at DESC')
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to root_path, notice: 'Post created succesfully!'
    else
      flash.now[:alert] = @post.errors.full_messages
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
end
