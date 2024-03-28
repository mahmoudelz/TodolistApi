class TodolistStatus
  # Define enum values as constants
  ONGOING = :ongoing
  DONE = :done

  # Define an array of all enum values
  VALUES = [ONGOING, DONE].freeze
end

class TodolistsController < ApplicationController

  
  def index
    todolist = Todolist.all
    render json: todolist, status: :created
  end

  def show

    todolist = Todolist.find(params[:id])
    render json: todolist, status: :ok
      
    rescue ActiveRecord::RecordNotFound
    render json: { error: "Todolist not found" }, status: :not_found
  end

  
  def create    
    user = User.create!(user_params)
    todolist = Todolist.new(todolist_params.merge(user_id: user.id))

    if todolist.save!
      render json: todolist, status: :created
    else
      render json: todolist.errors, status: :unprocessable_entity
    end
  end


  def destroy
    Todolist.find(params[:id]).destroy!
    
    head :no_content
  end

  def update
    todolist = Todolist.find(params[:id])
    if todolist.update(todolist_params)
      render json: todolist, status: :ok
    else
      render json: todolist.errors, status: :unprocessable_entity
    end
  end
  
  private
  
  def user_params
    params.require(:users).permit(:name)
  end
  
  def todolist_params
    params.require(:todolists).permit(:title)
  end
end
