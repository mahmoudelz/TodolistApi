class Todolist < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :title, uniqueness: true

  enum status: %i(ongoing done)

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at id id_value status title updated_at user_id]
  end



  # class TodolistStatus
  #   # Define enum values as constants
  #   ONGOING = :ongoing
  #   DONE = :done
  
  #   # Define an array of all enum values
  #   VALUES = [ONGOING, DONE].freeze
  # end
end
