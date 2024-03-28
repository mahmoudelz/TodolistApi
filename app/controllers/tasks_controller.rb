class TasklistStatus
  # Define enum values as constants
  WIP = :wip
  COMPLETED = :completed

  # Define an array of all enum values
  VALUES = [WIP, COMPLETED].freeze
end

class TasksController < ApplicationController

  before_action :set_todolist
  before_action :set_task, only: [:show, :update, :destroy]

  def index
    tasks = @todolist.tasks
    render json: tasks, status: :ok
  end

  def show
    render json: @task, status: :ok
  end
  
  def create
    task = @todolist.tasks.new(task_params)
      
    if task.save
      render json: task, status: :created
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    head :no_content
  end

  def update
    if @task.update(task_params)
      render json: @task, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private

  def set_todolist
    puts "Params: #{params.inspect}"
     @todolist = Todolist.find(params[:todolist_id])
  end

  def set_task
    @task = @todolist.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title)
  end
end
