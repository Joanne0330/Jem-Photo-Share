class CommentsController < ApplicationController
    def index

    end
  
    def new
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new
    end
    
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(comment_params)

      # redirect_to posts_path
      redirect_to post_comments_path
    end

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
  
      # redirect_to posts_path
    end


    private
      def comment_params
        params.require(:comment).permit(:text)
      end

end