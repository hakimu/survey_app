require 'rails_helper'

RSpec.describe Survey, type: :model do
  it 'is valid when there is a title' do
    survey = Survey.new(title: 'first_survey')
    expect(survey).to be_valid
  end

  it 'is not valid when there is no title' do
    survey = Survey.new(title: nil)
    survey.valid?
    expect(survey.errors[:title]).to include('can\'t be blank')
  end

  it '' do
    survey = Survey.new(title: 'test')
    
  end
end
