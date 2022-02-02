class CommentsController < ApplicationController
  before_action :find_comment, only: %i[destroy edit show update]
  before_action :authenticate_user!, except: %i[index show]

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to comment_path(@comment), notice: 'Comment edited succesfully!'
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
    @comment = Comment.new(comment_params)
    @comment[:user_id] = current_user.id

    if @comment.save
      s_notice = 'Comment created succesfully!'
      return redirect_to post_path(@comment.parent), notice: s_notice if @comment.parent.is_a?(Post)

      redirect_to comment_path(@comment.parent), notice: s_notice
    else
      flash[:alert] = @comment.errors.full_messages
      render @comment.parent, status: :unprocessable_entity
    end
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :parent_id, :parent_type, :post_id)
  end
end
