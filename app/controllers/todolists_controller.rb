class TodolistStatus
  # Define enum values as constants
  ONGOING = :ongoing
  DONE = :done

  # Define an array of all enum values
  VALUES = [ONGOING, DONE].freeze
end

class TodolistsController < ApplicationController

  
  def index
    render json: "<h1>hello</h1>"
  end
  
  def create
    # user = User.create(user_params)
    
    user = User.create!(user_params)
    todolist = Todolist.new(todolist_params.merge(user_id: user.id))

    if todolist.save!
      render json: todolist, status: :created
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
