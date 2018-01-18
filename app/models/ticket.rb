class Ticket < ActiveRecord::Base
  belongs_to :show_time
  belongs_to :movie
  belongs_to :audi_screen
  belongs_to :customer
  has_many :seat_types
  validates :seat,:show_time_id, :movie_id, :audi_screen_id, :customer_id , presence: true
  validates_numericality_of :seat, less_than_or_equal_to: 100
end
