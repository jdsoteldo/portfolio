class HomeController < ApplicationController
  def index
    @tasks = Task.order(:status)
  end
end
