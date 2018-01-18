class CreateAudiScreens < ActiveRecord::Migration
  def change
    create_table :audi_screens do |t|
      t.integer :capacity
      t.string :movie_name
      t.references :booking_theatre, index: true, foreign_key: true
      t.references :show_time, index: true, foreign_key: true
    end
  end
end
