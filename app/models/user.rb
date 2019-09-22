class User < ApplicationRecord
  has_secure_password
  has_many :responses
  has_many :questions, through: :responses
  validates :username, presence: true
end
