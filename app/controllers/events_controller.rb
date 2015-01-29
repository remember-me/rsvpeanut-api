class EventsController < ApplicationController
  def index
    #returns all events from eventbrite API, need to change to pull from her endpoint
    eventList = Event.all  
    render json: eventList, status: 200
  end
  def create

  end
end
