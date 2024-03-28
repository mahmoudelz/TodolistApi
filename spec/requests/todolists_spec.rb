require 'rails_helper'


  RSpec.describe 'Todolists', type: :request do
    
    describe 'GET /index' do
      let!(:todolist) { create(:todolist) }
      # before do
      #   FactoryBot.create(:todolist, title: '1984')
      # end
      
      
      it 'get all todolists' do
        get '/todolists'
        expect(response).to have_http_status(201)
        todolist_response = JSON.parse(response.body)
        # byebug
        expect(todolist_response).to eq(
          [
              {
              'id' => 1,
              'title' => 'Sample Todolist',
              'status'=> 0,
              'user'=> {
                "id"=> 1,
                "name"=> 'John Doe'
              },
              "tasks" => []
              }
           ]
          )
      end
    end
  
    describe "GET #show" do
    get "/todolists/#{:todolist.id}"
    expect(response).to have_http_status(201)
    todolist_response = JSON.parse(response.body)
    # byebug
    expect(todolist_response).to eq(
      [
          {
          'id' => 1,
          'title' => 'Sample Todolist',
          'status'=> 0,
          'user'=> {
            "id"=> 1,
            "name"=> 'John Doe'
          },
          "tasks" => []
          }
       ]
      )
    end
  
    describe "POST #create" do
      # Add your tests for the create action here
    end
  
    describe "PATCH #update" do
      # Add your tests for the update action here
    end
  
    describe "DELETE #destroy" do
      # Add your tests for the destroy action here
    end
  end
