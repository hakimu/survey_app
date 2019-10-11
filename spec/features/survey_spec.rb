require 'rails_helper'

RSpec.feature 'Surveys', type: :feature do
  let(:user) { create(:user) }
  let(:survey) { create(:survey) }
  let(:question) do
    create(:question, survey_id: survey.id)
  end
  let(:day_question) do
    create(:question, body: 'What is today?', survey_id: survey.id)
  end
  it 'a survey has questions' do
    color_question = create(:question)
    food_question = create(:question, body: 'What is your favorite food?')
    color_answers = [create(:answer, body: 'blue'), create(:answer, body: 'yellow'), create(:answer, body: 'orange'), create(:answer, body: 'green')]
    color_answers.each do |answer|
      color_question.answers << answer
    end
    expect(color_question.answers.count).to eq(4)
  end
  it 'a single user with two questions' do
    survey.questions << question
    survey.questions << day_question
    blue_answer = create(:answer, question_id: question.id)
    create(:answer, body: 'pink', question_id: question.id)
    yes_answer = create(:answer, body: 'Sunday', question_id: day_question.id)
    create(:answer, body: 'Monday', question_id: day_question.id)
    create(:response, user_id: user.id, answer_id: blue_answer.id)
    create(:response, user_id: user.id, answer_id: yes_answer.id)
    expect(user.responses.count).to eq(2)
    expect(user.responses.first.answer.body).to eq('blue')
    expect(user.responses.last.answer.body).to eq('Sunday')
  end
  it 'calculates the avg age of Users based on Response to a Question' do
    color_question = create(:question)
    old_user = create(:user, username: 'old', password: 'password', age: 99, education: 'college', gender: 'female')
    young_user = create(:user, username: 'young', password: 'password', age: 18, education: 'high school', gender: 'non-binary')
    color_answers = [create(:answer, body: 'blue'), create(:answer, body: 'yellow'), create(:answer, body: 'orange'), create(:answer, body: 'green')]
    color_answers.each do |answer|
      color_question.answers << answer
    end
    create(:response, user_id: user.id, answer_id: color_answers.first.id)
    create(:response, user_id: old_user.id, answer_id: color_answers.first.id)
    create(:response, user_id: young_user.id, answer_id: color_answers.first.id)
    expect(Response.where(answer_id: 1).joins(:user).average(:age).to_i).to eq(52)
  end
end
