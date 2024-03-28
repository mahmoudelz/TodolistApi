class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :status

  belongs_to :todolist
end
