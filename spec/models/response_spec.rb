require 'rails_helper'

RSpec.describe Response, type: :model do
  it 'needs a user to be valid' do
    answer = create(:answer)
    response = build(:response, user_id: nil, answer_id: answer.id)
    response.save
    expect(response.errors[:user]).to include('can\'t be blank')
  end
  it 'needs an answer to be valid' do
    user = create(:user)
    response = build(:response, user_id: user.id, answer_id: nil)
    response.save
    expect(response.errors[:answer]).to include('can\'t be blank')
  end
end
