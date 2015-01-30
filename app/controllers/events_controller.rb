class EventsController < ApplicationController
  after_action :access_control_headers
  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = "http://remember-me.github.io"
    headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
  end
  def index
    #returns all events from eventbrite API, need to change to pull from her endpoint
    eventList = Event.run_eventbrite_query({city: 'austin', address: '123 usa street', radius: '1mi'}) #change to params.
    render json: eventList, status: 200
  end
  def create
    @newEvent = Event.new event_params#params will be first:,last:,email:,password:
    @newEvent.save
    respond_to do |format|
      format.json { render :json => @newUser }
    end
    #@newItin = EventIntinerary.new
    #need returned event id and current user.
    #respond_to do |format|
      #format.json { render :json => @newItin}
    #end
  end
  private
  #def itin_params
    #params.require(stuff).permit(event_id,)
  #end
  def event_params    
    params.require(:event).permit(:name, :event_type, :location, :event_start, :event_end, :description, :lat, :long, :event_url)
  end
end
