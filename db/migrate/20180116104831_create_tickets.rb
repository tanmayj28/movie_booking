class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :seat
      t.references :show_time, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true
      t.references :audi_screen, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
    end
  end
end
