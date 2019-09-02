class Question < ApplicationRecord
  has_many :answers
  has_many :responses, through: :answers
  validates :body, presence: true
end
