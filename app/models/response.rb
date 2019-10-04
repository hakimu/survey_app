class Response < ApplicationRecord
  belongs_to :user
  belongs_to :answer
  validates :user, presence: true
  validates :answer, presence: true
end
