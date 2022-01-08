class PostsController < ApplicationController
  def index
    @posts = Post.all
    flash[:alert] = 'oh no'
  end
end
