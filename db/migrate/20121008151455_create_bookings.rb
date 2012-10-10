class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :sporcad_id
      t.column   :booked_at, :datetime

      t.timestamps
    end
  end
end
