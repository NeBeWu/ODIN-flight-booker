class BookingsController < ApplicationController
  def new
    @new_booking = Booking.new(booking_params)

    booking_params[:number_passengers].to_i.times do
      @new_booking.passengers.build
    end
  end

  def create; end

  private

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:flight_id, :number_passengers, passengers_attributes: %i[id name email])
  end
end