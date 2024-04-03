require 'rails_helper'


  RSpec.describe TasksController, type: :request do
    describe "GET #index" do
      let!(:task) { create(:task) }

      it 'get all tasks' do
        get '/tasks'
        expect(response).to have_http_status(200)
        task_response = JSON.parse(response.body)
        expect(task_response).to eq(
          [
              {
                'id' => 1,
                'title' => 'Sample Task',
                'status' => 0,
                "todolist" => {
                  "id"=>1,
                  "status"=>"ongoing",
                  "title"=>"Sample Todolist"
                }
              }
           ]
        )
      end
    end
  
    describe "GET #show" do
      let!(:task) { create(:task) }

      it "should specific task" do
        get "/tasks/#{task.id}"

        expect(response).to have_http_status(200)
        task_response = JSON.parse(response.body)
        expect(task_response).to eq(
          {
            'id' => 1,
            'title' => 'Sample Task',
            'status' => 0,
            "todolist" => {
              "id"=>1,
              "status"=>"ongoing",
              "title"=>"Sample Todolist"
            }
          }
        )
      end
    end
  
    describe "POST #create" do
      let(:todolist) { create(:todolist) }
      let(:task) { build(:task) }

      it "should create a task" do
        post "/tasks", params: {
          tasks: {
            title: task.title,
            todolist_id: todolist.id
          }
        }

        expect(response).to have_http_status(201)
        task_response = JSON.parse(response.body)
        expect(task_response).to eq(
            {
              "id"=>1,
              "title"=>"Sample Task",
              "status"=>nil,
              "todolist"=>{
                "id"=>1,
                "title"=>"Sample Todolist",
                "status"=>"ongoing"
              }
            }
        )
      end
    end
  
    describe "PATCH #update" do
    let!(:task) { create(:task, title: "This is the patched task")}
    it "Patch a task" do
      
      patch "/tasks/#{task.id}", params: {
        tasks: { title: "This is the updated task"}
      }
      expect(response).to have_http_status(200)
      item_response = JSON.parse(response.body)
      expect(item_response['title']).to eq("This is the updated task")
    end

  end
  
    describe "DELETE #destroy" do
    let!(:task) { create(:task) }
    it "Delete #destroy" do
      delete "/tasks/#{task.id}"
      expect { Task.find(task.id).to raise_error(ActiveRecord::RecordNotFound)}
    end

  end
  end
  