class PostsController < ApplicationController
  before_action :current, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post.user = current_user
    @post.update(posts_params)
    @post.save
    redirect_to posts_path
  end

  def destroy
    if @post.destroy
      redirect_to posts_path
    end
  end

  private

  def posts_params
    params.require(:post).permit(:title, :content, :user_id, :nickname, :image)
  end

  def current
    @post = Post.find_by(id: params[:id])
  end

end
