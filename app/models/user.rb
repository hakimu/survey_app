class User < ApplicationRecord
  has_many :responses
  has_many :questions, through: :responses
  validates :username, presence: true
end
