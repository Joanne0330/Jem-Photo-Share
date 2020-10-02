class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash.notice = "Post successfully saved!"
    else
      flash.alert = "Post rejected!"
    end

    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end



  private
  def post_params
    params.require(:post).permit(:title, :image, :user_id)
  end
end