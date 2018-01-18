require 'rails_helper'

RSpec.describe SeatType, type: :model do
  context 'validation test' do
    it 'is valid Seat Type' do
      FactoryGirl.build(:seat_type).should be_valid
    end

    it 'validates seat class is silver' do
      FactoryGirl.build(:seat_type, seat_class: 'silver').should be_valid
    end

    it 'validates seat class is bronze' do
      FactoryGirl.build(:seat_type, seat_class: 'bronze').should be_valid
    end

    it 'validates seat class is gold' do
      FactoryGirl.build(:seat_type, seat_class: 'gold').should be_valid
    end

    it 'validates seat class presence true' do
      FactoryGirl.build(:seat_type, seat_class: nil).should_not be_valid
    end
  end

  context 'assosiation test' do
    it 'should belongs to ticket' do
      ticketVar = FactoryGirl.create(:ticket)
      seat_typeVar = FactoryGirl.create(:seat_type, ticket_id: ticketVar.id)
      seat_typeVar.ticket_id.should eq ticketVar.id
    end

    it 'should not belongs to invalid ticket' do
      ticketVar1 = FactoryGirl.create(:ticket)
      ticketVar2 = FactoryGirl.create(:ticket)
      seat_typeVar = FactoryGirl.create(:seat_type, ticket_id: ticketVar1.id)
      seat_typeVar.ticket_id.should eq ticketVar1.id
      seat_typeVar.ticket_id.should_not eq ticketVar2.id
    end
  end
end
