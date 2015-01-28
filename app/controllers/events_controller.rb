class EventsController < ApplicationController
  def index
    #returns all events
    eventList = Event.all  
    render json: eventList, status: 200
  end
end
