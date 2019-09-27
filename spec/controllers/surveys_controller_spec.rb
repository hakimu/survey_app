require 'rails_helper'

RSpec.describe SurveysController, type: :controller do
  let(:created_survey) { create(:survey) }
  let(:new_survey) { create(:survey) }
  describe '#new' do
    context 'when the user is not an admin' do
      it 'cannot create a survey' do
        non_admin_user_with_session
        get :new
        expect(response.code).to eq('401')
      end
    end
    context 'when the user is an admin' do
      it 'is able to create a new survey' do
        admin_user_with_session
        get :new
        expect(response.code).to eq('200')
      end
    end
  end
  describe '#edit' do
    context 'when the user is not an admin' do
      it 'cannot edit a survey' do
        non_admin_user_with_session
        get :edit, params: { id: created_survey.id }
        expect(response.code).to eq('401')
      end
    end
    context 'when the user is an admin' do
      it 'can edit a survey' do
        admin_user_with_session
        get :edit, params: { id: created_survey.id }
        expect(response.code).to eq('200')
      end
    end
  end
  describe '#create' do
    context 'when the user is not an admin' do
      it 'cannot create a survey ' do
        non_admin_user_with_session
        new_survey.save
        get :create
        expect(response.code).to eq('401')
      end
    end
    context 'when the user is an admin' do
      it 'can create a survey' do
        admin_user_with_session
        new_survey.save
        get :create
        expect(response.code).to eq('200')
      end
    end
  end
  describe '#destroy' do
    context 'when the user is not an admin' do
      it 'cannot destroy a survey' do
        non_admin_user_with_session
        get :destroy, params: { id: created_survey.id }
        created_survey.destroy
        expect(response.code).to eq('401')
      end
    end
    context 'when the user is an admin' do
      it 'can destroy a survey' do
        admin_user_with_session
        get :destroy, params: { id: created_survey.id }
        created_survey.destroy
        expect(response.code).to eq('302')
      end
    end
  end
end

def non_admin_user_with_session
  user = create(:user)
  session[:user_id] = user.id
end

def admin_user_with_session
  user = create(:user, admin: true)
  session[:user_id] = user.id
end
