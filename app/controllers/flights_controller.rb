class FlightsController < ApplicationController
  before_action :set_departure_airports, :set_arrival_airports, :set_flight_dates

  def index
    return if params[:flight].nil?

    query_flights
    @number_passengers = flight_params[:number_passengers]
  end

  private

  def set_departure_airports
    @departure_airports = Flight.select('airports.location').joins(:departure_airport)
                                .order(location: :asc).distinct.map(&:location)
  end

  def set_arrival_airports
    @arrival_airports = Flight.select('airports.location').joins(:arrival_airport)
                              .order(location: :asc).distinct.map(&:location)
  end

  def set_flight_dates
    @flight_dates = Flight.select('start_datetime').where('start_datetime >= ?', Time.now.to_date)
                          .order(start_datetime: :asc).distinct.map(&:start_datetime).map(&:to_date)
  end

  # Only allow a list of trusted parameters through.
  def flight_params
    params.require(:flight).permit(:departure_airport, :arrival_airport, :flight_date, :number_passengers)
  end

  def query_flights
    @flights = Flight.joins(:departure_airport, :arrival_airport)
                     .where('airports.location = ?', flight_params[:departure_airport])
                     .where('arrival_airports_flights.location = ?', flight_params[:arrival_airport])
                     .where('flights.start_datetime::date = ?', flight_params[:flight_date])
                     .includes(%i[departure_airport arrival_airport])
  end
end
