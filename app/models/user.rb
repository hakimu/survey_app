class User < ApplicationRecord
  EDUCATION = %w[none high\ school ged college post\ graduate].freeze
  GENDER = %w[male female non-binary].freeze
  has_secure_password
  has_many :responses
  has_many :questions, through: :responses
  validates :username, presence: true
  validates :age, presence: true
  validates :education, inclusion: {
    in: EDUCATION,
    message: '%{value} is not a education'
  }
  validates :gender, inclusion: {
    in: GENDER,
    message: '%{value} is not a valid gender'
  }

  scope :senior, -> { where('age > 55') }
  scope :teenager, -> { where('age > 12 AND age < 20') }
end
