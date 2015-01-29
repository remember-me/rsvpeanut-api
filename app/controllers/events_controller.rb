class EventsController < ApplicationController
  def index
    #returns all events from eventbrite API, need to change to pull from her endpoint
    eventList = Event.run_eventbrite_query({city: 'austin', address: '123 usa street', radius: '1mi'}) #change to params.
    render json: eventList, status: 200
  end
  def create
    @createEntry = Event.new(params)
    if Event.find(@createEntry['url'])
      flash[:alert] = 'This item exists'
    else
      @createEntry.save
    end
    #conditional for save that includes check for event already in DB.
  end
end
