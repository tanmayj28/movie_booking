require 'rails_helper'

RSpec.describe BookingTheatre, type: :model do
  context 'validation test' do
    it 'validates Booking theatre' do
      FactoryGirl.build(:booking_theatre).should be_valid
    end

    it 'validates Theatre_name presence true' do
      FactoryGirl.build(:booking_theatre, theatre_name: nil).should_not be_valid
    end

    it 'validates phone length more than 15' do
      FactoryGirl.build(:booking_theatre, phone: '123456789123456789').should_not be_valid
    end

    it 'validates phone presence true' do
      FactoryGirl.build(:booking_theatre, phone: nil).should_not be_valid
    end

    it 'validates phone length less than 10' do
      FactoryGirl.build(:booking_theatre, phone: '123456').should_not be_valid
    end

    it 'validates invalid address' do
      FactoryGirl.build(:booking_theatre, address: nil).should_not be_valid
    end
  end

  context 'assosiation test' do
    it 'should has many customers' do
      booking_theatreVar = FactoryGirl.create(:booking_theatre)
      customerVar1 = FactoryGirl.create(:customer, booking_theatre_id: booking_theatreVar.id)
      customerVar2 = FactoryGirl.create(:customer, booking_theatre_id: booking_theatreVar.id)
      customerVar1.booking_theatre_id.should eq booking_theatreVar.id
      customerVar2.booking_theatre_id.should eq booking_theatreVar.id
    end

    it 'should has many movies' do
      booking_theatreVar = FactoryGirl.create(:booking_theatre)
      movieVar1 = FactoryGirl.create(:movie, booking_theatre_id: booking_theatreVar.id)
      movieVar2 = FactoryGirl.create(:movie, booking_theatre_id: booking_theatreVar.id)
      movieVar1.booking_theatre_id.should eq booking_theatreVar.id
      movieVar2.booking_theatre_id.should eq booking_theatreVar.id
    end

    it 'should has many audi Screens' do
      booking_theatreVar = FactoryGirl.create(:booking_theatre)
      audi_screenVar1 = FactoryGirl.create(:audi_screen, booking_theatre_id: booking_theatreVar.id)
      audi_screenVar2 = FactoryGirl.create(:audi_screen, booking_theatre_id: booking_theatreVar.id)
      audi_screenVar1.booking_theatre_id.should eq booking_theatreVar.id
      audi_screenVar2.booking_theatre_id.should eq booking_theatreVar.id
    end

    it 'should not has uninluded customers' do
      booking_theatreVar1 = FactoryGirl.create(:booking_theatre)
      booking_theatreVar2 = FactoryGirl.create(:booking_theatre)
      customerVar1 = FactoryGirl.create(:customer, booking_theatre_id: booking_theatreVar1.id)
      customerVar2 = FactoryGirl.create(:customer, booking_theatre_id: booking_theatreVar2.id)
      customerVar1.booking_theatre_id.should eq booking_theatreVar1.id
      customerVar1.booking_theatre_id.should_not eq booking_theatreVar2.id
      customerVar2.booking_theatre_id.should eq booking_theatreVar2.id
      customerVar2.booking_theatre_id.should_not eq booking_theatreVar1.id
    end

    it 'should not has included movies' do
      booking_theatreVar1 = FactoryGirl.create(:booking_theatre)
      booking_theatreVar2 = FactoryGirl.create(:booking_theatre)
      movieVar1 = FactoryGirl.create(:movie, booking_theatre_id: booking_theatreVar1.id)
      movieVar2 = FactoryGirl.create(:movie, booking_theatre_id: booking_theatreVar2.id)
      movieVar1.booking_theatre_id.should eq booking_theatreVar1.id
      movieVar1.booking_theatre_id.should_not eq booking_theatreVar2.id
      movieVar2.booking_theatre_id.should eq booking_theatreVar2.id
      movieVar2.booking_theatre_id.should_not eq booking_theatreVar1.id
    end

    it 'should not has unincluded audi Screens' do
      booking_theatreVar1 = FactoryGirl.create(:booking_theatre)
      booking_theatreVar2 = FactoryGirl.create(:booking_theatre)
      audi_screenVar1 = FactoryGirl.create(:audi_screen, booking_theatre_id: booking_theatreVar1.id)
      audi_screenVar2 = FactoryGirl.create(:audi_screen, booking_theatre_id: booking_theatreVar2.id)
      audi_screenVar1.booking_theatre_id.should eq booking_theatreVar1.id
      audi_screenVar1.booking_theatre_id.should_not eq booking_theatreVar2.id
      audi_screenVar2.booking_theatre_id.should eq booking_theatreVar2.id
      audi_screenVar2.booking_theatre_id.should_not eq booking_theatreVar1.id
    end
  end
end
