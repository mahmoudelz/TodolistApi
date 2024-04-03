class TasksController < ApplicationController
  # before_action :set_todolist, only: [:create]
  before_action :set_task, only: [:show, :update, :destroy]

  def index
    render json: Task.all, status: :ok
  end

  def show
    render json: @task, status: :ok
  end
  
  def create
    task = Task.new(task_params)
    if task.save!
      render json: task, status: :created
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy!
  end

  def update
    if @task.update(task_params)
      render json: @task, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private

  def set_task
    begin
      @task = Task.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Task not found" }, status: :not_found
    end
  end

  def set_todolist
    @todolist = Todolist.find_or_create_by(title: todolist_params[:title])
  end

  def task_params
    params.require(:tasks).permit(:title, :todolist_id)
  end
end
