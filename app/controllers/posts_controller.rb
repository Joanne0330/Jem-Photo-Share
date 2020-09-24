class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
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
    params.require(:post).permit(:title, :image)
  end
end