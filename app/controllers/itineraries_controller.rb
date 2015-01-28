class ItinerariesController < ApplicationController
  def index
    itineraryList = Intineraries.all
    render json: itineraryList, status: 200
  end
end
