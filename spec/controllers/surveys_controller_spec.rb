require 'rails_helper'

RSpec.describe SurveysController, type: :controller do
  describe '#new' do
    context 'when the user is not an admin' do
      it 'cannot create a survey' do
        user = create(:user)
        session[:user_id] = user.id
        get :new
        expect(response.code).to eq('401')
      end
    end
    context 'when the user is an admin' do
      it 'is able to create a new survey' do
        user = create(:user, admin: true)
        session[:user_id] = user.id
        get :new
        expect(response.code).to eq('200')
      end
    end
  end
  describe '#edit' do
    context 'when the user is not an admin' do
      it 'cannot edit a survey' do
        user = create(:user)
        session[:user_id] = user.id
        survey = create(:survey)
        get :edit, params: { id: survey.id }
        expect(response.code).to eq('401')
      end
    end
    context 'when the user is an admin' do
      it 'can edit a survey' do
        user = create(:user, admin: true)
        session[:user_id] = user.id
        survey = create(:survey)
        get :edit, params: { id: survey.id }
        expect(response.code).to eq('200')
      end
    end
  end
  describe '#create' do
    context 'when the user is not an admin' do
      it 'cannot create a survey ' do
        user = create(:user)
        session[:user_id] = user.id
        survey = build(:survey)
        survey.save
        get :create, params: { id: survey.id }
        expect(response.code).to eq('401')
      end
    end
  end
end
