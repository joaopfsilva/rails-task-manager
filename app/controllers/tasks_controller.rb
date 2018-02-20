class TasksController < ApplicationController

  before_action :not_dry, only: [:show, :edit, :update, :destroy]

  def new
    @task = Task.new
  end

  def index
    @tasks = Task.all
  end

  def edit
  end


  def show
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def not_dry
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end



# As a user I can display the details of a task
# As a user I can add a task in my ToDo list
# As a user I can edit the details of a task
# As a user I can remove a task from my ToDo list
