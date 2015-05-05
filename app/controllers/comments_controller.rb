class CommentsController < ApplicationController
  def create
    @post=Post.find params[:post_id]
    @comment=@post.comments.new comment_params
    if @comment.save
      redirect_to post_path(@post), notice: 'Comment created..'
    else
      render post_path(@post), flash.now[:alert]='Could not create comment. Check errors below:'
    end

  end

  def destroy
    @post=Post.find params[:post_id]
    @comment=@post.comments.find params[:id]

    if @comment.destroy
      redirect_to post_path(@post), notice: 'Comment deleted'
    else
      render post_path(@post), flash.now[:alert]='Could not delete comment. Check errors below:'
    end
  end


  private
  def comment_params
    params.require(:comment).permit :name, :body
  end
end
