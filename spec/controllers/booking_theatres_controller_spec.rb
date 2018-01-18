require 'rails_helper'

RSpec.describe BookingTheatresController, type: :controller do
  context 'GET' do
    it 'all success' do
      get :index
      response.should have_http_status(:ok)
    end

    it 'booking_theatre success' do
      booking_theatre = FactoryGirl.create(:booking_theatre)
      get :show, id: booking_theatre.id
      response.should have_http_status(:ok)
    end

    it 'booking_theatre not success' do
      booking_theatre = FactoryGirl.create(:booking_theatre)
      get :show, id: ''
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do
    it 'booking_theatre success' do
      booking_theatre = FactoryGirl.create(:booking_theatre)
      post :create, booking_theatre: { theatre_name: booking_theatre.theatre_name, address: booking_theatre.address, phone: booking_theatre.phone }
      response.should have_http_status(:ok)
    end

    it 'booking_theatre not success' do
      post :create, booking_theatre: { theatre_name: '', address: '', phone: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do
    it 'booking_theatre success' do
      booking_theatre = FactoryGirl.create(:booking_theatre)
      put :update, id: booking_theatre.id, booking_theatre: { theatre_name: booking_theatre.theatre_name, address: booking_theatre.address, phone: booking_theatre.phone }
      response.should have_http_status(:ok)
    end

    it 'booking_theatre not success' do
      booking_theatre = FactoryGirl.create(:booking_theatre)
      put :update, id: booking_theatre.id, booking_theatre: { theatre_name: '', address: '', phone: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do
    it 'booking_theatre success' do
      booking_theatre = FactoryGirl.create(:booking_theatre)
      delete :destroy, id: booking_theatre.id
      response.should have_http_status(:ok)
    end

    it 'booking_theatre not success' do
      booking_theatre = FactoryGirl.create(:booking_theatre)
      delete :destroy, id: ''
      response.should have_http_status(:unprocessable_entity)
    end
  end
end
