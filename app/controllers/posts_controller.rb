class PostsController < ApplicationController
  def show
    @post = Post.find params[:id]
  end
  
  def new
    @post = Post.new
  end

  def create
    byebug
    @post = Post.new post_params
    if @post.save
      flash[:success] = "Create success"
    else
      flash[:danger] = "Fail"
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit :title, :body, :image
  end
end
