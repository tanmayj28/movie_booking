class Customer < ActiveRecord::Base
  belongs_to :booking_theatre
  has_many :tickets
  validates :name, :phone, :age, :booking_theatre_id, presence: true
  validates :phone, length: { in: 10..15 }
  enum gender: %i[male female]
  validates_numericality_of :age, less_than_or_equal_to: 100
end
