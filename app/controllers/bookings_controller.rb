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

    mail_passengers

    redirect_to "/bookings/#{@new_booking.id}", notice: 'Flight booked.'
  end

  private

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:flight_id, :number_passengers, passengers_attributes: %i[id name email])
  end

  # Mail each passenger on booking creation
  def mail_passengers
    @new_booking.passengers.each do |passenger|
      PassengerMailer.with(passenger:, booking: @new_booking).booking_confirmation.deliver_later
    end
  end
end
