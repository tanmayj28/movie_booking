require 'rails_helper'

RSpec.describe Ticket, type: :model do
  context 'validation test' do
    it 'is valid Ticket' do
      FactoryGirl.build(:ticket).should be_valid
    end

    it 'validates seat presence true' do
      FactoryGirl.build(:ticket, seat: nil).should_not be_valid
    end

    it 'validates seat less than equal to 100' do
      FactoryGirl.build(:ticket, seat: 120).should_not be_valid
    end

    it 'validates seat less than 100' do
      FactoryGirl.build(:ticket, seat: 22).should be_valid
    end
  end

  context 'assosiation test' do
    it 'should belongs to show_time' do
      show_timeVar = FactoryGirl.create(:show_time)
      ticketVar = FactoryGirl.create(:ticket, show_time_id: show_timeVar.id)
      ticketVar.show_time_id.should eq show_timeVar.id
    end

    it 'should belongs to movie' do
      movieVar = FactoryGirl.create(:movie)
      ticketVar = FactoryGirl.create(:ticket, movie_id: movieVar.id)
      ticketVar.movie_id.should eq movieVar.id
    end

    it 'should belongs to audi screens' do
      audi_screenVar = FactoryGirl.create(:audi_screen)
      ticketVar = FactoryGirl.create(:ticket, audi_screen_id: audi_screenVar.id)
      ticketVar.audi_screen_id.should eq audi_screenVar.id
    end

    it 'should belongs to customer' do
      customerVar = FactoryGirl.create(:customer)
      ticketVar = FactoryGirl.create(:ticket, customer_id: customerVar.id)
      ticketVar.customer_id.should eq customerVar.id
    end

    it 'should has many seat types' do
      ticketVar = FactoryGirl.create(:ticket)
      seat_typeVar1 = FactoryGirl.create(:seat_type, ticket_id: ticketVar.id)
      seat_typeVar2 = FactoryGirl.create(:seat_type, ticket_id: ticketVar.id)
      seat_typeVar1.ticket_id.should(eq ticketVar.id) && seat_typeVar2.ticket_id.should(eq ticketVar.id)
    end

    it 'should not belongs to invalid show_time' do
      show_timeVar1 = FactoryGirl.create(:show_time)
      show_timeVar2 = FactoryGirl.create(:show_time)
      ticketVar = FactoryGirl.create(:ticket, show_time_id: show_timeVar1.id)
      ticketVar.show_time_id.should eq show_timeVar1.id
      ticketVar.show_time_id.should_not eq show_timeVar2.id
    end

    it 'should not belongs to invalid movie' do
      movieVar1 = FactoryGirl.create(:movie)
      movieVar2 = FactoryGirl.create(:movie)
      ticketVar = FactoryGirl.create(:ticket, movie_id: movieVar1.id)
      ticketVar.movie_id.should eq movieVar1.id
      ticketVar.movie_id.should_not eq movieVar2.id
    end

    it 'should not belongs to invalid audi screens' do
      audi_screenVar1 = FactoryGirl.create(:audi_screen)
      audi_screenVar2 = FactoryGirl.create(:audi_screen)
      ticketVar = FactoryGirl.create(:ticket, audi_screen_id: audi_screenVar1.id)
      ticketVar.audi_screen_id.should eq audi_screenVar1.id
      ticketVar.audi_screen_id.should_not eq audi_screenVar2.id
    end

    it 'should not belongs to invalid customer' do
      customerVar1 = FactoryGirl.create(:customer)
      customerVar2 = FactoryGirl.create(:customer)
      ticketVar = FactoryGirl.create(:ticket, customer_id: customerVar1.id)
      ticketVar.customer_id.should eq customerVar1.id
      ticketVar.customer_id.should_not eq customerVar2.id
    end

    it 'should not has many unincluded seat types' do
      ticketVar1 = FactoryGirl.create(:ticket)
      ticketVar2 = FactoryGirl.create(:ticket)
      seat_typeVar1 = FactoryGirl.create(:seat_type, ticket_id: ticketVar1.id)
      seat_typeVar2 = FactoryGirl.create(:seat_type, ticket_id: ticketVar2.id)
      seat_typeVar1.ticket_id.should eq ticketVar1.id
      seat_typeVar1.ticket_id.should_not eq ticketVar2.id
      seat_typeVar2.ticket_id.should eq ticketVar2.id
      seat_typeVar2.ticket_id.should_not eq ticketVar1.id
    end
  end
end
