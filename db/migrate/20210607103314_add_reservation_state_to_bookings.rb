class AddReservationStateToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :reservation_state, :string
  end
end
