class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :arrival_date
      t.date :departure_date
      t.integer :nights
      t.integer :guest_id

      t.timestamps
    end
  end
end
