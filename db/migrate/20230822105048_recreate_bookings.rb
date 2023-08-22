class RecreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.integer :rating
      t.integer :status
      t.references :user, foreign_key: true
      t.references :spaceship, foreign_key: true

      t.timestamps
    end
  end
end
