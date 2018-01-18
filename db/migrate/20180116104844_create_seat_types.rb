class CreateSeatTypes < ActiveRecord::Migration
  def change
    create_table :seat_types do |t|
      t.integer :seat_class
      t.references :ticket, index: true, foreign_key: true
    end
  end
end
