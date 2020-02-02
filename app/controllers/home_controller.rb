class HomeController < ApplicationController
  def index
    @tasks = Task.all.order(:status)
  end
end
