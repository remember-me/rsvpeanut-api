class EventsController < ApplicationController
  def show
    eventList = Events.all  
    render json: eventList, status: 200
  end
end
