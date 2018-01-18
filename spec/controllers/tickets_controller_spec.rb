require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  context 'GET' do
    it 'all success' do
      get :index
      response.should have_http_status(:ok)
    end

    it 'ticket success' do
      ticket = FactoryGirl.create(:ticket)
      get :show, id: ticket.id
      response.should have_http_status(:ok)
    end

    it 'ticket not success' do
      ticket = FactoryGirl.create(:ticket)
      get :show, id: ''
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do
    it 'ticket success' do
      ticket = FactoryGirl.create(:ticket)
      post :create, ticket: { seat: ticket.seat, show_time_id: ticket.show_time_id, movie_id:ticket.movie_id, audi_screen_id:ticket.audi_screen_id, customer_id:ticket.customer_id }
      response.should have_http_status(:ok)
    end

    it 'ticket success' do
      ticket = FactoryGirl.create(:ticket)
      post :create, ticket: { seat: ticket.seat, show_time_id: '678', movie_id:'6723', audi_screen_id:'56', customer_id:'1232' }
      response.should have_http_status(:unprocessable_entity)
    end

    it 'ticket not success' do
      post :create, ticket: { seat: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do
    it 'ticket success' do
      ticket = FactoryGirl.create(:ticket)
      put :update, id: ticket.id, ticket: { seat: ticket.seat }
      response.should have_http_status(:ok)
    end

    it 'ticket not success' do
      ticket = FactoryGirl.create(:ticket)
      put :update, id: ticket.id, ticket: { seat: ticket.seat, show_time_id: '678', movie_id:'6723', audi_screen_id:'56', customer_id:'1232' }
      response.should have_http_status(:unprocessable_entity)
    end

    it 'ticket not success' do
      ticket = FactoryGirl.create(:ticket)
      put :update, id: ticket.id, ticket: { seat: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do
    it 'ticket success' do
      ticket = FactoryGirl.create(:ticket)
      delete :destroy, id: ticket.id
      response.should have_http_status(:ok)
    end

    it 'ticket not success' do
      ticket = FactoryGirl.create(:ticket)
      delete :destroy, id: ''
      response.should have_http_status(:unprocessable_entity)
    end
  end
end
