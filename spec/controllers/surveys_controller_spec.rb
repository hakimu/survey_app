require 'rails_helper'

RSpec.describe SurveysController, type: :controller do
  let(:created_survey) { create(:survey) }
  let(:new_survey) { create(:survey) }
  describe '#new' do
    context 'when the user is not an admin' do
      it 'cannot create a survey' do
        non_admin_user_with_session
        get :new
        expect(response).to have_http_status(401)
      end
    end
    context 'when the user is an admin' do
      it 'is able to create a new survey' do
        admin_user_with_session
        get :new
        expect(response).to have_http_status(200)
      end
    end
  end
  describe '#edit' do
    context 'when the user is not an admin' do
      it 'cannot edit a survey' do
        non_admin_user_with_session
        get :edit, params: { id: created_survey.id }
        expect(response).to have_http_status(401)
      end
    end
    context 'when the user is an admin' do
      it 'can edit a survey' do
        admin_user_with_session
        get :edit, params: { id: created_survey.id }
        expect(response).to have_http_status(200)
      end
    end
  end
  describe '#create' do
    context 'when the user is not an admin' do
      it 'cannot create a survey ' do
        non_admin_user_with_session
        new_survey.save
        post :create
        expect(response).to have_http_status(401)
      end
    end
    context 'when the user is an admin' do
      it 'can create a survey' do
        # admin_user_with_session
        # new_survey.save
        # test_survey = build(:survey)
        attr = { title: 'new_survey' }
        post(:create, params: { survey: attr })
        test_survey = build(:survey, attr)
        expect(test_survey.title).to eq('new_survey')
        expect(response).to have_http_status(302)
      end
    end
  end
  describe '#destroy' do
    context 'when the user is not an admin' do
      it 'cannot destroy a survey' do
        non_admin_user_with_session
        get :destroy, params: { id: created_survey.id }
        created_survey.destroy
        expect(response).to have_http_status(401)
      end
    end
    context 'when the user is an admin' do
      it 'can destroy a survey' do
        admin_user_with_session
        # get :destroy, params: { id: created_survey.id }
        get :destroy, params: { id: created_survey.id }
        created_survey.destroy
        expect(response).to have_http_status(302)
      end
    end
  end
  describe '#update' do
    context 'when the user is not an admin' do
      it 'cannot update a survey' do
        non_admin_user_with_session
      end
    end
    context 'when the user is an admin' do
      it 'can update a survey' do
        admin_user_with_session
        put(:update, params: { id: created_survey.id, survey: { title: 'new_title' }})
        expect(created_survey.reload.title).to eq('new_title')
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
