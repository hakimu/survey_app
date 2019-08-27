require 'rails_helper'

RSpec.describe Survey, type: :model do
  it 'is valid when there is a title' do
    survey = build(:survey)
    expect(survey).to be_valid
  end

  it 'is not valid when there is no title' do
    survey = build(:survey, title: nil)
    survey.valid?
    expect(survey.errors[:title]).to include('can\'t be blank')
  end

  it 'is able to have many questions' do
    first_question = create(:question)
    second_question = create(:question, body: 'What country do you live in?')
    third_question = create(:question, body: 'How old are you?')
    survey = create(:survey)
    survey.questions << first_question
    survey.questions << second_question
    survey.questions << third_question
    expect(survey.questions.count).to eq(3)
  end
end
