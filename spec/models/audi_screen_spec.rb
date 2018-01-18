require 'rails_helper'

RSpec.describe AudiScreen, type: :model do
  context 'validation test' do
    it 'validates Audi Screen' do
      FactoryGirl.build(:audi_screen).should be_valid
    end

    it 'is valid movie name' do
      FactoryGirl.build(:audi_screen, movie_name: 'Moonlight').should be_valid
    end

    it 'is valid capacity' do
      FactoryGirl.build(:audi_screen, capacity: 90).should be_valid
    end

    it 'validates movie name presence true' do
      FactoryGirl.build(:audi_screen, movie_name: nil).should_not be_valid
    end

    it 'validates capacity presence true' do
      FactoryGirl.build(:audi_screen, capacity: nil).should_not be_valid
    end

    it 'validates capacity less_than_or_equal_to 100' do
      FactoryGirl.build(:audi_screen, capacity: 200).should_not be_valid
    end

    it ' validates booking theatre is not nil' do
      FactoryGirl.build(:audi_screen, booking_theatre_id: nil).should_not be_valid
    end
  end

  context 'assosiation test' do
    it 'should belongs to booking' do
      booking = FactoryGirl.create(:booking_theatre)
      audi_screen = FactoryGirl.create(:audi_screen, booking_theatre_id: booking.id)
      audi_screen.booking_theatre_id.should eq booking.id
    end

    it 'should belongs to show time' do
      show = FactoryGirl.create(:show_time)
      audi_screen = FactoryGirl.create(:audi_screen, show_time_id: show.id)
      audi_screen.show_time_id.should eq show.id
    end

    it 'should has many ticekts' do
      audi_screenVar = FactoryGirl.create(:audi_screen)
      ticketVar1 = FactoryGirl.create(:ticket, audi_screen_id: audi_screenVar.id)
      ticketVar2 = FactoryGirl.create(:ticket, audi_screen_id: audi_screenVar.id)
      audi_screenVar.tickets.should include ticketVar1
      audi_screenVar.tickets.should include ticketVar2
    end

    it 'should not belongs to invalid booking' do
      booking1 = FactoryGirl.create(:booking_theatre)
      booking2 = FactoryGirl.create(:booking_theatre)
      audi_screen = FactoryGirl.create(:audi_screen, booking_theatre_id: booking1.id)
      audi_screen.booking_theatre_id.should eq booking1.id
      audi_screen.booking_theatre_id.should_not eq booking2.id
    end

    it 'should not belongs to invalid show time' do
      show1 = FactoryGirl.create(:show_time)
      show2 = FactoryGirl.create(:show_time)
      audi_screen = FactoryGirl.create(:audi_screen, show_time_id: show1.id)
      audi_screen.show_time_id.should eq show1.id
      audi_screen.show_time_id.should_not eq show2.id
    end

    it 'should not have unincluded customers' do
      audi_screenVar1 = FactoryGirl.create(:audi_screen)
      audi_screenVar2 = FactoryGirl.create(:audi_screen)
      ticketVar1 = FactoryGirl.create(:ticket, audi_screen_id: audi_screenVar1.id)
      ticketVar2 = FactoryGirl.create(:ticket, audi_screen_id: audi_screenVar2.id)
      ticketVar1.audi_screen_id.should eq audi_screenVar1.id
      ticketVar1.audi_screen_id.should_not eq audi_screenVar2.id
      ticketVar2.audi_screen_id.should eq audi_screenVar2.id
      ticketVar2.audi_screen_id.should_not eq audi_screenVar1.id
    end
  end
end
