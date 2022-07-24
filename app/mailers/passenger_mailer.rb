class PassengerMailer < ApplicationMailer
  def booking_confirmation
    @passenger = params[:passenger]
    @booking = params[:booking]
    @flight = @booking.flight

    mail(to: email_address_with_name(@passenger.email, @passenger.name),
         subject: 'Booking confirmation')
  end
end
