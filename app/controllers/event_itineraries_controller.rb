class EventItinerariesController < ApplicationController
  def show
    @eventItin = EventIntineraries.find(params[:id])
    render json: @eventItin, status: 200
  end
  def index
    @itinEvent = EventIntineraries.all
    render json: @itinEvent, status: 200
  end
end
