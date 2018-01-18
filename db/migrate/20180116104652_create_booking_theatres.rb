class CreateBookingTheatres < ActiveRecord::Migration
  def change
    create_table :booking_theatres do |t|
      t.string :theatre_name
      t.string :address
      t.string :phone
    end
  end
end
