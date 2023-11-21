class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|

      t.timestamps
    end
  end
end
