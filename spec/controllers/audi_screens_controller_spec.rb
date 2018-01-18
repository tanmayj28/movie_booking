require 'rails_helper'

RSpec.describe AudiScreensController, type: :controller do
  context 'GET' do
    it 'all success' do
      get :index
      response.should have_http_status(:ok)
    end

    it 'audi success' do
      audi = FactoryGirl.create(:audi_screen)
      get :show, id: audi.id
      response.should have_http_status(:ok)
    end

    it 'audi not success' do
      audi = FactoryGirl.create(:audi_screen)
      get :show, id: ''
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do
    it 'audi success' do
      audi = FactoryGirl.create(:audi_screen)
      post :create, audi_screen: { capacity: audi.capacity, movie_name: audi.movie_name, booking_theatre_id: audi.booking_theatre_id, show_time_id: audi.show_time_id}
      response.should have_http_status(:ok)
    end

    it 'audi not success' do
      audi = FactoryGirl.create(:audi_screen)
      post :create, audi_screen: { capacity: audi.capacity, movie_name: audi.movie_name, booking_theatre_id:'1232', show_time_id:'122'}
      response.should have_http_status(:unprocessable_entity)
    end

    it 'audi not success' do
      post :create, audi_screen: { capacity: '', movie_name: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do
    it 'audi success' do
      audi = FactoryGirl.create(:audi_screen)
      put :update, id: audi.id, audi_screen: { capacity: audi.capacity, movie_name: audi.movie_name}
      response.should have_http_status(:ok)
    end

    it 'audi not success' do
      audi = FactoryGirl.create(:audi_screen)
      put :update, id: audi.id, audi_screen: { capacity: audi.capacity, movie_name: audi.movie_name, booking_theatre_id:'1232', show_time_id:'122'}
      response.should have_http_status(:unprocessable_entity)
    end


    it 'audi not success' do
      audi = FactoryGirl.create(:audi_screen)
      put :update, id: audi.id, audi_screen: { capacity: '', movie_name: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do
    it 'audi success' do
      audi = FactoryGirl.create(:audi_screen)
      delete :destroy, id: audi.id
      response.should have_http_status(:ok)
    end

    it 'audi not success' do
      audi = FactoryGirl.create(:audi_screen)
      delete :destroy, id: ''
      response.should have_http_status(:unprocessable_entity)
    end
  end
end
