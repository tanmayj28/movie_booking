require 'rails_helper'

RSpec.describe SeatTypesController, type: :controller do
  context 'GET' do
    it 'all success' do
      get :index
      response.should have_http_status(:ok)
    end

    it 'seat_type success' do
      seat_type = FactoryGirl.create(:seat_type)
      get :show, id: seat_type.id
      response.should have_http_status(:ok)
    end

    it 'seat_type not success' do
      seat_type = FactoryGirl.create(:seat_type)
      get :show, id: ''
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do
    it 'seat_type success' do
      seat_type = FactoryGirl.create(:seat_type)
      post :create, seat_type: { seat_class: seat_type.seat_class, ticket_id: seat_type.ticket_id }
      response.should have_http_status(:ok)
    end

    it 'seat_type not success' do
      seat_type = FactoryGirl.create(:seat_type)
      post :create, seat_type: { seat_class: seat_type.seat_class, ticket_id: '2112' }
      response.should have_http_status(:unprocessable_entity)
    end

    it 'seat_type not success' do
      post :create, seat_type: { seat_class: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do
    it 'seat_type success' do
      seat_type = FactoryGirl.create(:seat_type)
      put :update, id: seat_type.id, seat_type: { seat_class: seat_type.seat_class }
      response.should have_http_status(:ok)
    end

    it 'seat_type not success' do
      seat_type = FactoryGirl.create(:seat_type)
      put :update, id: seat_type.id, seat_type: { seat_class: seat_type.seat_class, ticket_id:'12312' }
      response.should have_http_status(:unprocessable_entity)
    end

    it 'seat_type not success' do
      seat_type = FactoryGirl.create(:seat_type)
      put :update, id: seat_type.id, seat_type: { seat_class: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do
    it 'seat_type success' do
      seat_type = FactoryGirl.create(:seat_type)
      delete :destroy, id: seat_type.id
      response.should have_http_status(:ok)
    end

    it 'seat_type not success' do
      seat_type = FactoryGirl.create(:seat_type)
      delete :destroy, id: ''
      response.should have_http_status(:unprocessable_entity)
    end
  end
end
