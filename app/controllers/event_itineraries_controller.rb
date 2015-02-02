class EventItinerariesController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def show
    @eventItin = EventIntineraries.find(event_itin_params)
    render json: @eventItin, status: 200
  end
  def index
    @itinEvent = EventIntineraries.all
    render json: @itinEvent, status: 200
  end
  def create
    @newItin = EventIntineraries.new itin_params
    @newItin.save
    #need returned event id and current user.
    respond_to do |format|
      format.json { render :json =>{:event_itineraries => @newItin}}
    end
  end
  private
  def event_itin_params
    params.require(:event_itineraries).permit(:event_id,:itinerary_id)
  end
end
