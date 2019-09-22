require 'rails_helper'

RSpec.describe User, type: :model do
  it 'needs a username to be valid' do
    user = build(:user, username: nil)
    user.valid?
    expect(user.errors.full_messages).to include('Username can\'t be blank')
  end
  it 'needs a password to be valid' do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors.full_messages).to include('Password can\'t be blank')
  end
end
