class HomeController < ApplicationController
  def index
    @tasks = Task.order(:status)
    @posts = Post.all
  end
end
