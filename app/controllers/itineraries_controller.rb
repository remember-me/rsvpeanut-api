class ItinerariesController < ApplicationController
  def index
    @itineraryList = Intineraries.all
    render json: @itineraryList, status: 200
  end
  def show
    @showItin = Intineraries.find(itin_params)
    render json: @showItin, status: 200
  end
end
