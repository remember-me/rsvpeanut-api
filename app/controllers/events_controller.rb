class EventsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
 
  def index
    #returns all events from eventbrite API, need to change to pull from her endpoint
    eventList = Event.all
    render json: eventList, status: 200
  end
  def create
    @newEvent = Event.new event_params#params will be first:,last:,email:,password:
    @newEvent.save
    respond_to do |format|
      format.json { render :json => {:event => @newEvent} }
    end
    # @newItin = EventIntinerary.new itin_params
    # #need returned event id and current user.
    # respond_to do |format|
    #   format.json { render :json => @newItin}
    # end
  end
  private
  def itin_params
    params.require(:event_itineraries).permit(:event_id, :itinerary_id)
  end
  def event_params    
    params.require(:event).permit(:name, :event_type, :location, :event_start, :event_end, :description, :lat, :long, :event_url,:attendees,:cost,:source)
  end
end
