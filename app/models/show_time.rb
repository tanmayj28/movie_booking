class ShowTime < ActiveRecord::Base
  belongs_to :movie
  validates :movie_time, :movie_id, presence: true
end
