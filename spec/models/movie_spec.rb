require 'rails_helper'

RSpec.describe Movie, type: :model do
  context 'validation test' do
    it 'is valid Movie' do
      FactoryGirl.build(:movie).should be_valid
    end

    it 'validates movie rating presence nil' do
      FactoryGirl.build(:movie, rating: nil).should be_valid
    end

    it 'validates movie name presence true' do
      FactoryGirl.build(:movie, name: nil).should_not be_valid
    end

    it 'validates audi presence true' do
      FactoryGirl.build(:movie, audi_no: nil).should_not be_valid
    end

    it 'validates movie rating in 5' do
      FactoryGirl.build(:movie, rating: 6).should_not be_valid
    end
  end

  context 'assosiation test' do
    it 'should belongs to booking' do
      booking = FactoryGirl.create(:booking_theatre)
      movie = FactoryGirl.create(:movie, booking_theatre_id: booking.id)
      movie.booking_theatre_id.should eq booking.id
    end

    it 'should not belongs to invalid booking' do
      booking1 = FactoryGirl.create(:booking_theatre)
      booking2 = FactoryGirl.create(:booking_theatre)
      movie = FactoryGirl.create(:movie, booking_theatre_id: booking1.id)
      movie.booking_theatre_id.should eq booking1.id
      movie.booking_theatre_id.should_not eq booking2.id
    end
  end

  context 'assosiation test' do
    it 'should has many show_time' do
      movieVar = FactoryGirl.create(:movie)
      show_timeVar1 = FactoryGirl.create(:show_time, movie_id: movieVar.id)
      show_timeVar2 = FactoryGirl.create(:show_time, movie_id: movieVar.id)
      show_timeVar1.movie_id.should eq movieVar.id
      show_timeVar2.movie_id.should eq movieVar.id
    end

    it 'should has many tickets' do
      movieVar = FactoryGirl.create(:movie)
      ticketVar1 = FactoryGirl.create(:ticket, movie_id: movieVar.id)
      ticketVar2 = FactoryGirl.create(:ticket, movie_id: movieVar.id)
      ticketVar1.movie_id.should(eq movieVar.id) && ticketVar2.movie_id.should(eq movieVar.id)
    end

    it 'should not has invalid show_time' do
      movieVar1 = FactoryGirl.create(:movie)
      movieVar2 = FactoryGirl.create(:movie)
      show_timeVar1 = FactoryGirl.create(:show_time, movie_id: movieVar1.id)
      show_timeVar2 = FactoryGirl.create(:show_time, movie_id: movieVar2.id)
      show_timeVar1.movie_id.should eq movieVar1.id
      show_timeVar1.movie_id.should_not eq movieVar2.id
      show_timeVar2.movie_id.should eq movieVar2.id
      show_timeVar2.movie_id.should_not eq movieVar1.id
    end

    it 'should not has invalid tickets' do
      movieVar1 = FactoryGirl.create(:movie)
      movieVar2 = FactoryGirl.create(:movie)
      ticketVar1 = FactoryGirl.create(:ticket, movie_id: movieVar1.id)
      ticketVar2 = FactoryGirl.create(:ticket, movie_id: movieVar2.id)
      ticketVar1.movie_id.should eq movieVar1.id
      ticketVar1.movie_id.should_not eq movieVar2.id
      ticketVar2.movie_id.should eq movieVar2.id
      ticketVar2.movie_id.should_not eq movieVar1.id
    end
  end
end
