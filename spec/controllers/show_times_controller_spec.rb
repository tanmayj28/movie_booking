require 'rails_helper'

RSpec.describe ShowTimesController, type: :controller do
  context 'GET' do
    it 'all success' do
      get :index
      response.should have_http_status(:ok)
    end

    it 'show_time success' do
      show_time = FactoryGirl.create(:show_time)
      get :show, id: show_time.id
      response.should have_http_status(:ok)
    end

    it 'show_time success' do
      show_time = FactoryGirl.create(:show_time)
      get :show, id: ''
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do
    it 'show_time success' do
      show_time = FactoryGirl.create(:show_time)
      post :create, show_time: { movie_time: show_time.movie_time, movie_id: show_time.movie_id }
      response.should have_http_status(:ok)
    end

    it 'show_time not success' do
      show_time = FactoryGirl.create(:show_time)
      post :create, show_time: { movie_time: show_time.movie_time, movie_id: '454' }
      response.should have_http_status(:unprocessable_entity)
    end

    it 'show_time not success' do
      post :create, show_time: { movie_time: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do
    it 'show_time success' do
      show_time = FactoryGirl.create(:show_time)
      put :update, id: show_time.id, show_time: { movie_time: show_time.movie_time }
      response.should have_http_status(:ok)
    end

    it 'show_time success' do
      show_time = FactoryGirl.create(:show_time)
      put :update, id: show_time.id, show_time: { movie_time: show_time.movie_time, movie_id:'1212' }
      response.should have_http_status(:unprocessable_entity)
    end

    it 'show_time not success' do
      show_time = FactoryGirl.create(:show_time)
      put :update, id: show_time.id, show_time: { movie_time: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do
    it 'show_time success' do
      show_time = FactoryGirl.create(:show_time)
      delete :destroy, id: show_time.id
      response.should have_http_status(:ok)
    end

    it 'show_time not success' do
      show_time = FactoryGirl.create(:show_time)
      delete :destroy, id: ''
      response.should have_http_status(:unprocessable_entity)
    end
  end
end
