class PostsController < ApplicationController
  def index
    @posts=Post.all.order 'created_at DESC'
  end

  def new
    @post=Post.new
  end

  def create
    @post=Post.new post_params
    if @post.save
      redirect_to @post, notice: 'Post successfully added..'
    else
      flash.now[:error] =  'Could not save post. Check the errors below: '
      render :new
    end
  end

  def show
    @post=Post.find params[:id]
  end

  def edit
    @post=Post.find params[:id]
  end

  def update
    @post=Post.find params[:id]
    if @post.update post_params
      redirect_to @post, notice: 'Post successfully updated..'
    else
      flash.now[:error] = 'Could not update post. Check the errors below: '
      render :new
    end
  end

  def destroy
    @post=Post.find params[:id]
    if @post.destroy
      redirect_to root_path, notice: 'Post deleted'
    else
      redirect_to :back, error: 'Could not delete post'
    end
  end


  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
