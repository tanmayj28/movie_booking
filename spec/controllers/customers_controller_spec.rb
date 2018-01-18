require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  context 'GET' do
    it 'all success' do
      get :index
      response.should have_http_status(:ok)
    end

    it 'customer success' do
      customer = FactoryGirl.create(:customer)
      get :show, id: customer.id
      response.should have_http_status(:ok)
    end

    it 'customer not success' do
      customer = FactoryGirl.create(:customer)
      get :show, id: ''
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do
    it 'customer success' do
      customer = FactoryGirl.create(:customer)
      post :create, customer: { name: customer.name, phone: customer.phone, age: customer.age, gender: customer.gender, booking_theatre_id: customer.booking_theatre_id }
      response.should have_http_status(:ok)
    end

    it 'customer success' do
      customer = FactoryGirl.create(:customer)
      post :create, customer: { name: customer.name, phone: customer.phone, age: customer.age, gender: customer.gender, booking_theatre_id: '12321' }
      response.should have_http_status(:unprocessable_entity)
    end

    it 'customer not success' do
      post :create, customer: { name: '', phone: '', age: '', gender: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do
    it 'customer success' do
      customer = FactoryGirl.create(:customer)
      put :update, id: customer.id, customer: { name: customer.name, phone: customer.phone, age: customer.age, gender: customer.gender }
      response.should have_http_status(:ok)
    end

    it 'customer not success' do
      customer = FactoryGirl.create(:customer)
      put :update, id: customer.id, customer: { name: customer.name, phone: customer.phone, age: customer.age, gender: customer.gender, booking_theatre_id: '1223' }
      response.should have_http_status(:unprocessable_entity)
    end

    it 'customer not success' do
      customer = FactoryGirl.create(:customer)
      put :update, id: customer.id, customer: { name: '', phone: '', age: '', gender: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do
    it 'customer success' do
      customer = FactoryGirl.create(:customer)
      delete :destroy, id: customer.id
      response.should have_http_status(:ok)
    end

    it 'customer not success' do
      customer = FactoryGirl.create(:customer)
      delete :destroy, id: 'avc'
      response.should have_http_status(:unprocessable_entity)
    end

    it 'customer not success' do
      customer = FactoryGirl.create(:customer)
      delete :destroy, id: ''
      response.should have_http_status(:unprocessable_entity)
    end
  end
end
