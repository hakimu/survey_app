require 'rails_helper'

RSpec.feature "Surveys", type: :feature do
  it 'a survey has questions' do
    color_question = create(:question)
    food_question = create(:question, body: 'What is your favorite food?')
    color_answers = [create(:answer, body: 'blue'), create(:answer, body: 'yellow'), create(:answer, body: 'orange'), create(:answer, body: 'green')]
    color_answers.each do |answer|
      color_question.answers << answer
    end
    expect(color_question.answers.count).to eq(4)
  end
end

