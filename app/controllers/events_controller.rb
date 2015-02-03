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

    @newItin = EventItinerary.new itin_params
    @newItin.save
    #need returned event id and current user.
    respond_to do |format|
      format.json { render :json =>{:event_itineraries => @newItin}}
    end
  end
  private
  def itin_params
    params.require(:event_itineraries).permit(:itinerary_id)
  end
  def event_params    
    params.require(:event).permit(:name, :event_type, :location, :UTC_start, :UTC_end, :description, :lat, :long, :event_url,:attendees,:cost,:source,:date_start,:date_end,:time_start,:time_end,:venue)
  end
end
