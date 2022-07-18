class BookingController < ApplicationController
  def new
    @new_booking = Booking.new
  end

  def create; end

  private

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:fligth, :number_passengers)
  end
end
