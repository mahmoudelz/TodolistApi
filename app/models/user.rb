class User < ApplicationRecord
    has_many :todolists, dependent: :destroy

    validates :name, uniqueness: true
end
