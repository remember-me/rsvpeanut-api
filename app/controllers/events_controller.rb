class EventsController < ApplicationController
  def index
    #returns all events from eventbrite API, need to change to pull from her endpoint
    eventList = Event.run_eventbrite_query({city: 'austin', address: '123 usa street', radius: '1mi'}) #change to params.
    render json: eventList, status: 200
  end
  def create
    @createEntry = Event.create(params)
    #conditional for save that includes check for event already in DB.
    if @createEntry = e['url'] 
      flash[:alert] = 'This event already exists'
    else
      flash[:notice] = 'This event was added'
  end
end
