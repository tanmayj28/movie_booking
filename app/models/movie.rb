class Movie < ActiveRecord::Base
  belongs_to :booking_theatre
  has_many :show_times
  has_many :tickets
  validates :name, :audi_no, :booking_theatre_id, presence: true
  validates_inclusion_of :rating, in: [1, 2, 3, 4, 5], allow_nil: true
end
