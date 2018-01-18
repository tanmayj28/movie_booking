class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.integer :age
      t.integer :gender
      t.references :booking_theatre, index: true, foreign_key: true
    end
  end
end
