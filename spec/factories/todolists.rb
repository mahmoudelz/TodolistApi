# FactoryBot.define do
#     factory :todolist do
#     title { "Sample Todolist" }
#     status { "pending" }
#     end
# end

FactoryBot.define do  
  factory :todolist do
    title { "Sample Todolist" }
    status { 0 }
    association :user, factory: :user
  end
end