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
end
