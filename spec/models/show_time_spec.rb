require 'rails_helper'

RSpec.describe ShowTime, type: :model do
  context 'validation test' do
    it 'is valid Show Time' do
      FactoryGirl.build(:show_time).should be_valid
    end

    it 'validates movie time presence true' do
      FactoryGirl.build(:show_time, movie_time: nil).should_not be_valid
    end
  end

  context 'assosiation test' do
    it 'should belongs to movie' do
      movieVar = FactoryGirl.create(:movie)
      show_timeVar = FactoryGirl.create(:show_time, movie_id: movieVar.id)
      show_timeVar.movie_id.should eq movieVar.id
    end

    it 'should not belongs to invalid movie' do
      movieVar1 = FactoryGirl.create(:movie)
      movieVar2 = FactoryGirl.create(:movie)
      show_timeVar = FactoryGirl.create(:show_time, movie_id: movieVar1.id)
      show_timeVar.movie_id.should eq movieVar1.id
      show_timeVar.movie_id.should_not eq movieVar2.id
    end
  end
end
