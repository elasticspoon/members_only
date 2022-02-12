class CommentsController < ApplicationController
  before_action :find_comment, only: %i[destroy edit show update]
  before_action :authenticate_user!, except: %i[index show]
  before_action :create_comment, only: %i[show create]

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to @comment.path_parent, notice: 'Comment edited succesfully!'
    else
      render action: 'edit', status: :unprocessable_entity
    end
  end

  def show; end

  def destroy
    post = @comment.post
    @comment.destroy
    redirect_to post_path(post), notice: 'Comment was succesfully deleted.'
  end

  def create
    @new_comment[:user_id] = current_user.id

    if @new_comment.update(comment_params)
      redirect_to @new_comment.path_parent, notice: 'Comment created succesfully!'

    else
      flash[:alert] = @new_comment.errors.full_messages
      render @new_comment.path_parent, status: :unprocessable_entity
    end
  end

  def index
    redirect_to post_path(params[:post_id])
  end

  private

  def find_comment
    @comment = Comment.includes(:comments, :user, :post, :parent).find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def create_comment
    return unless user_signed_in?

    @new_comment = Comment.create_new_comment(request)
  end
end
