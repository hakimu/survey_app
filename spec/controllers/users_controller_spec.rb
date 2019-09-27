require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new’ do'
    it 'returns http success' do
      get :new
    expect(response).to have_http_status(:success)
  end

  describe 'GET #create' do
    it 'returns http success' do
      user = build(:user)
      user.save
      get :create, params: { id: user.id }
    expect(response.code).to eq('302')
    end
  end
end
