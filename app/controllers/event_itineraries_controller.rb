class EventItinerariesController < ApplicationController
  def show
    @eventItin = EventIntineraries.all
    render json: @eventItin, status: 200
  end
end
