class Survey < ApplicationRecord
  has_many :questions
  has_many :responses, through: :questions
  validates :title, presence: true
end

# users_answers has_many_through with an association of response
# Survey
# quesiton
# users
# Need a join table with survey id, question id, user id probably the answer id
# May need multiple join tables, users_surveys (primary key identifying instance of a survey, survey id and user id) and survey_responses(will link the id key off of user_surveys maybe the question_id or answer_id)
