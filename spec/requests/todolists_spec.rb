require 'rails_helper'


  RSpec.describe 'Todolists', type: :request do
    
    describe 'GET /index' do
      
      let!(:todolist) { create(:todolist) }
      # before do
      #   FactoryBot.create(:todolist, title: '1984')
      # end
      
      
      it 'get all todolists' do 
        
        get "/todolists"
        
        expect(response).to have_http_status(200)
        todolist_response = JSON.parse(response.body)
        
        expect(todolist_response).to eq(
          [
              {
              'id' => 1,
              'title' => 'Sample Todolist',
              'status'=> "ongoing",
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
    let!(:todolist) { create(:todolist) }
    it "show todolists for specific user" do
      # byebug
      get "/todolists/#{todolist.id}"
      
      expect(response).to have_http_status(200)
      todolist_response = JSON.parse(response.body)
      expect(todolist_response).to eq(
        {
            'id' => 1,
            'title' => 'Sample Todolist',
            'status'=> "ongoing",
            'user'=> {
              "id"=> 1,
              "name"=> 'John Doe'
            },
            "tasks" => []
            }
        )
  
    end


  
    end
  
    describe "POST #create" do
  #   let(:variables) do {
  #     title: 'eng',
  #     user_name: 'hesham'
  #   }
  # end
  
      let(:todolist) { build(:todolist, title: "test") }

      it "Post a new Todolist" do

        post "/todolists", params: {
            todolists: { title: todolist.title},
            users: {name: todolist.user.name}
        }
        expect(response).to have_http_status(201)
        item_response = JSON.parse(response.body)
        expect(item_response['title']).to eq(todolist.title)
      end
    end
  
    describe "PATCH #update" do
      let!(:todolist) { create(:todolist, title: "This is a new title") }
      it "Patch a Todolist" do
        
        patch "/todolists/#{todolist.id}", params: {
          todolists: { title: "This is the updated title"}
      }
      expect(response).to have_http_status(200)
      item_response = JSON.parse(response.body)
      expect(item_response['title']).to eq("This is the updated title")
      
      end      
    end
  
    describe "DELETE #destroy" do
    let!(:todolist) { create(:todolist) }
    it "Delete Todo list" do
    
      delete "/todolists/#{todolist.id}"
      
      #  expect(response).to have_http_status(204)
      #  todolist_response = JSON.parse(response.body)
      expect { Todolist.find(todolist.id) }.to raise_error(ActiveRecord::RecordNotFound)

      # expect(Todolist.find(todolist.id)).to raise_error(ActiveRecord::RecordNotFound)
      #  expect(todolist_response.find_by(id: todolist_response.id)).to be_nil

    end
  end
end

