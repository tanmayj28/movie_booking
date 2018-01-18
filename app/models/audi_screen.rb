class AudiScreen < ActiveRecord::Base
  belongs_to :booking_theatre
  belongs_to :show_time
  has_many :tickets
  validates :movie_name, :capacity, :booking_theatre_id, :show_time_id, presence: true
  validates_numericality_of :capacity, less_than_or_equal_to: 100
end