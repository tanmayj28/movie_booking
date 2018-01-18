class SeatType < ActiveRecord::Base
  belongs_to :ticket
  enum seat_class: %i[bronze silver gold]
  validates :seat_class, :ticket_id, presence: true
end
