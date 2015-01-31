class EventsController < ApplicationController
  
 
  def index
    #returns all events from eventbrite API, need to change to pull from her endpoint
    eventList = Event.all
    render json: eventList, status: 200
  end
  def create
    @newEvent = Event.new event_params#params will be first:,last:,email:,password:
    @newEvent.save
    respond_to do |format|
      format.json { render :json => {:user => @newEvent} }
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
