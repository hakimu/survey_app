class Answer < ApplicationRecord
  belongs_to :question
  # has_many :responses, through: :answers
  has_many :responses
  validates :body, presence: true
end
