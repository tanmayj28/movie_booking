class BookingTheatre < ActiveRecord::Base
  has_many :customers
  has_many :movies
  has_many :audi_screens
  validates :theatre_name, :phone, :address, presence: true
  validates :phone, length: { in: 10..15 }
end
