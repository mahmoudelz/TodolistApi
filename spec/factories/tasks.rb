FactoryBot.define do
    factory :task do
      title { "Sample Task" }
      status { "pending" }
      association :todolist, factory: :todolist
    end
  end