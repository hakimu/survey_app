require 'rails_helper'

RSpec.describe Question, type: :model do
  it 'is only valid when there is a body to the question.' do
    question = Question.new(body: 'What is your name?')
    expect(question).to be_valid
  end

  it 'is not valid unless there is a body' do
    question = Question.new(body: nil)
    question.valid?
    expect(question.errors[:body]).to include('can\'t be blank')
  end
end
