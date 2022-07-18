class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @new_booking = Booking.new(booking_params)

    @new_booking.number_passengers.times do
      @new_booking.passengers.build
    end
  end

  def create
    @new_booking = Booking.create(booking_params)

    redirect_to "/bookings/#{@new_booking.id}", notice: 'Flight booked.'
  end

  private

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:flight_id, :number_passengers, passengers_attributes: %i[id name email])
  end
end
