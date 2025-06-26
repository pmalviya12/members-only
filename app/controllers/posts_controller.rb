class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "Post Created Successfully!!!"
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :title, :body)
  end
end
