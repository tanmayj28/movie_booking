class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :audi_no
      t.integer :rating
      t.references :booking_theatre, index: true, foreign_key: true
    end
  end
end
