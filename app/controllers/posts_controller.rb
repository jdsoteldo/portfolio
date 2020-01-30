class PostsController < ApplicationController
  before_action :current, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def show

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def posts_params
    params.require(:post).permit(:title, :content)
  end

  def current
    @post = Post.find_by(id: params[:id])
  end

end
