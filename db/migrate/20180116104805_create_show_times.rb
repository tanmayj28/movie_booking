class CreateShowTimes < ActiveRecord::Migration
  def change
    create_table :show_times do |t|
      t.time :movie_time
      t.references :movie, index: true, foreign_key: true
    end
  end
end
