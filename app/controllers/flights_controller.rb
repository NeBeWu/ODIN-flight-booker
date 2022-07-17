class FlightsController < ApplicationController
  def index
    @flights = Flight.all.includes(%i[departure_airport arrival_airport])
  end
end
