require 'rails_helper'

RSpec.describe Customer, type: :model do
  context 'validation test' do
    it 'is valid Customer' do
      FactoryGirl.build(:customer).should be_valid
    end

    it 'validates phone length more than 15' do
      FactoryGirl.build(:customer, phone: '123456789123456789').should_not be_valid
    end

    it 'validates phone length less than 10' do
      FactoryGirl.build(:customer, phone: '123456').should_not be_valid
    end

    it 'validates name presence true' do
      FactoryGirl.build(:customer, name: nil).should_not be_valid
    end

    it 'validates phone presence true' do
      FactoryGirl.build(:customer, phone: nil).should_not be_valid
    end

    it 'validates age presence true' do
      FactoryGirl.build(:customer, age: nil).should_not be_valid
    end

    it 'validates invalid age' do
      FactoryGirl.build(:customer, age: '123456').should_not be_valid
    end
  end

  context 'assosiation test' do
    it 'should belongs to booking' do
      booking = FactoryGirl.create(:booking_theatre)
      customer = FactoryGirl.create(:customer, booking_theatre_id: booking.id)
      customer.booking_theatre_id.should eq booking.id
    end

    it 'should has many tickets' do
      customerVar = FactoryGirl.create(:customer)
      ticket1 = FactoryGirl.create(:ticket, customer_id: customerVar.id)
      ticket2 = FactoryGirl.create(:ticket, customer_id: customerVar.id)
      ticket1.customer_id.should eq customerVar.id
      ticket2.customer_id.should eq customerVar.id
    end

    it 'should not belongs to invalid booking' do
      booking1 = FactoryGirl.create(:booking_theatre)
      booking2 = FactoryGirl.create(:booking_theatre)
      customer = FactoryGirl.create(:customer, booking_theatre_id: booking1.id)
      customer.booking_theatre_id.should eq booking1.id
      customer.booking_theatre_id.should_not eq booking2.id
    end

    it 'should not has uninclded tickets' do
      customerVar1 = FactoryGirl.create(:customer)
      customerVar2 = FactoryGirl.create(:customer)
      ticket1 = FactoryGirl.create(:ticket, customer_id: customerVar1.id)
      ticket2 = FactoryGirl.create(:ticket, customer_id: customerVar2.id)
      ticket1.customer_id.should eq customerVar1.id
      ticket1.customer_id.should_not eq customerVar2.id
      ticket2.customer_id.should eq customerVar2.id
      ticket2.customer_id.should_not eq customerVar1.id
    end
  end
end
