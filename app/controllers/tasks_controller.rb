class TasksController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.create!(task_params)
    redirect_to task_path(task.id)
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task.id)
  end

  def destroy
    @task.destroy!
    redirect_to tasks_path
end

  private

  def task_params
    params.require(:task).permit(:title, :detail, :id)
  end

  def set_restaurant
    @task = Task.find(params[:id])
  end
end
