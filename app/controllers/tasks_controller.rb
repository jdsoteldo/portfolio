class TasksController < ApplicationController
  before_action :current, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @task.destroy
  end

  def edit
  end

  def update
    @task.update(task_params)
    @task.save
    redirect_to root_path
  end

  def status
    @task = Task.find_by(id: params[:id])
    @task.update(status: 'approved') if params[:status] == 'approved'
    @task.update(status: 'pending') if params[:status] == 'pending'
    @task.save
    redirect_to root_path  
  end

  private

  def task_params
    params.require(:task).permit(:task, :status)
  end

  def current
    @task = Task.find_by(id: params[:id])
  end

end
