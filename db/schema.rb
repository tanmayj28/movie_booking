
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_180_116_104_844) do
  create_table 'audi_screens', force: :cascade do |t|
    t.integer 'capacity',           limit: 4
    t.string  'movie_name',         limit: 255
    t.integer 'booking_theatre_id', limit: 4
    t.integer 'show_time_id',       limit: 4
  end

  add_index 'audi_screens', ['booking_theatre_id'], name: 'index_audi_screens_on_booking_theatre_id', using: :btree
  add_index 'audi_screens', ['show_time_id'], name: 'index_audi_screens_on_show_time_id', using: :btree

  create_table 'booking_theatres', force: :cascade do |t|
    t.string 'theatre_name', limit: 255
    t.string 'address',      limit: 255
    t.string 'phone',        limit: 255
  end

  create_table 'customers', force: :cascade do |t|
    t.string  'name',               limit: 255
    t.string  'phone',              limit: 255
    t.integer 'age',                limit: 4
    t.integer 'gender',             limit: 4
    t.integer 'booking_theatre_id', limit: 4
  end

  add_index 'customers', ['booking_theatre_id'], name: 'index_customers_on_booking_theatre_id', using: :btree

  create_table 'movies', force: :cascade do |t|
    t.string  'name',               limit: 255
    t.integer 'audi_no',            limit: 4
    t.integer 'rating',             limit: 4
    t.integer 'booking_theatre_id', limit: 4
  end

  add_index 'movies', ['booking_theatre_id'], name: 'index_movies_on_booking_theatre_id', using: :btree

  create_table 'seat_types', force: :cascade do |t|
    t.integer 'seat_class', limit: 4
    t.integer 'ticket_id',  limit: 4
  end

  add_index 'seat_types', ['ticket_id'], name: 'index_seat_types_on_ticket_id', using: :btree

  create_table 'show_times', force: :cascade do |t|
    t.time    'movie_time'
    t.integer 'movie_id', limit: 4
  end

  add_index 'show_times', ['movie_id'], name: 'index_show_times_on_movie_id', using: :btree

  create_table 'tickets', force: :cascade do |t|
    t.integer 'seat',           limit: 4
    t.integer 'show_time_id',   limit: 4
    t.integer 'movie_id',       limit: 4
    t.integer 'audi_screen_id', limit: 4
    t.integer 'customer_id',    limit: 4
  end

  add_index 'tickets', ['audi_screen_id'], name: 'index_tickets_on_audi_screen_id', using: :btree
  add_index 'tickets', ['customer_id'], name: 'index_tickets_on_customer_id', using: :btree
  add_index 'tickets', ['movie_id'], name: 'index_tickets_on_movie_id', using: :btree
  add_index 'tickets', ['show_time_id'], name: 'index_tickets_on_show_time_id', using: :btree

  add_foreign_key 'audi_screens', 'booking_theatres'
  add_foreign_key 'audi_screens', 'show_times'
  add_foreign_key 'customers', 'booking_theatres'
  add_foreign_key 'movies', 'booking_theatres'
  add_foreign_key 'seat_types', 'tickets'
  add_foreign_key 'show_times', 'movies'
  add_foreign_key 'tickets', 'audi_screens'
  add_foreign_key 'tickets', 'customers'
  add_foreign_key 'tickets', 'movies'
  add_foreign_key 'tickets', 'show_times'
end
