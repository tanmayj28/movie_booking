require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  context 'GET' do
    it 'all success' do
      get :index
      response.should have_http_status(:ok)
    end

    it 'movie success' do
      movie = FactoryGirl.create(:movie)
      get :show, id: movie.id
      response.should have_http_status(:ok)
    end

    it 'movie not success' do
      movie = FactoryGirl.create(:movie)
      get :show, id: ''
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do
    it 'movie success' do
      movie = FactoryGirl.create(:movie)
      post :create, movie: { name: movie.name, audi_no: movie.audi_no, rating: movie.rating, booking_theatre_id: movie.booking_theatre_id }
      response.should have_http_status(:ok)
    end

    it 'movie not success' do
      movie = FactoryGirl.create(:movie)
      post :create, movie: { name: movie.name, audi_no: movie.audi_no, rating: movie.rating, booking_theatre_id: '11212' }
      response.should have_http_status(:unprocessable_entity)
    end

    it 'movie not success' do
      post :create, movie: { name: '', audi_no: '', rating: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do
    it 'movie success' do
      movie = FactoryGirl.create(:movie)
      put :update, id: movie.id, movie: { name: movie.name, audi_no: movie.audi_no, rating: movie.rating }
      response.should have_http_status(:ok)
    end

    it 'movie not success' do
      movie = FactoryGirl.create(:movie)
      put :update, id: movie.id, movie: { name: movie.name, audi_no: movie.audi_no, rating: movie.rating, booking_theatre_id: '1312' }
      response.should have_http_status(:unprocessable_entity)
    end

    it 'movie not success' do
      movie = FactoryGirl.create(:movie)
      put :update, id: movie.id, movie: { name: '', audi_no: '', rating: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do
    it 'movie success' do
      movie = FactoryGirl.create(:movie)
      delete :destroy, id: movie.id
      response.should have_http_status(:ok)
    end

    it 'movie not success' do
      movie = FactoryGirl.create(:movie)
      delete :destroy, id: ''
      response.should have_http_status(:unprocessable_entity)
    end
  end
end
