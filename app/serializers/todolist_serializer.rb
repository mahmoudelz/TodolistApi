class TodolistSerializer < ActiveModel::Serializer
  attributes :id, :title, :status

  belongs_to :user
  has_many :tasks
end
