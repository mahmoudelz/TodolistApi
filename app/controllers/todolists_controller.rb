class TodolistsController < ApplicationController
  before_action :set_user, only: [:create]
  before_action :set_todolist, only: [:show, :destroy, :update]

  def index
    @q = Todolist.ransack(params[:q])
    @todolists = @q.result(distinct: true)
    render json: @todolists, status: :ok

    HardJob.perform_in(5.seconds)

  end

  
  def search
    index
    render :index
  end

  def show
    render json: @todolist, status: :ok
  end

  
  # def create  
  #   user = User.create!(user_params)
  #   todolist = Todolist.new(todolist_params.merge(user_id: user.id))

  #   if todolist.save!
  #     render json: todolist, status: :created
  #   else
  #     render json: todolist.errors, status: :unprocessable_entity
  #   end
  # end

  def create 
    todolist = @user.todolists.new(todolist_params)
    if todolist.save!
      render json: todolist, status: :created
    else
      render json: todolist.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @todolist.destroy!
  end

  def update
    if @todolist.update(todolist_params)
      render json: @todolist, status: :ok
    else
      render json: @todolist.errors, status: :unprocessable_entity
    end
  end
  
  private

  def set_todolist
    begin
      @todolist = Todolist.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Todolist not found" }, status: :not_found
    end
  end

  def user_params
    params.require(:users).permit(:name)
  end
  
  def todolist_params
    params.require(:todolists).permit(:title)
  end

  def set_user
    @user = User.find_or_create_by(name: user_params[:name])
  end

  def ransearch
    @query = Todolist.ransack("sample")
    @todolists = @query.result(distinct: true)
  end

  # def set_user 
  #   @user = User.find(params[:user_id])
  # end
end
