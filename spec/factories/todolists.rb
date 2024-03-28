# FactoryBot.define do
#     factory :todolist do
#     title { "Sample Todolist" }
#     status { "pending" }
#     end
# end

FactoryBot.define do
    factory :user do
      name { "John Doe" }
    end
  
    factory :todolist do
      title { "Sample Todolist" }
      status { "pending" }
      association :user, factory: :user
    end
  end