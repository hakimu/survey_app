require 'rails_helper'

RSpec.describe Answer, type: :model do
  it 'creates a valid answer' do
    answer = build(:answer)
    expect(answer).to be_valid
  end
end

