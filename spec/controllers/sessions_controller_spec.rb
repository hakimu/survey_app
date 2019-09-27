require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  before(:each) do
    user = create(:user, admin: true)
    session[:user_id] = user.id
  end
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    it 'returns http success' do
      get :create
      expect(response.code).to eq('302')
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      get :destroy
      expect(response.code).to eq('302')
    end
  end
end
