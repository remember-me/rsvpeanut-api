class ItinerariesController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def index
    @itineraryList = Itinerary.all
    render json: @itineraryList, status: 200
  end
  def show
    @showItin = Itinerary.find(itin_params)
    render json: @showItin, status: 200
  end
  def create
    @newItinerary = Itinerary.new itin_params
    @newItinerary.save
    respond_to do |format|
      format.json { render :json =>{ :itineraries => @newItinerary}}
    end
    @newEvent = Event.new event_params
    @newEvent.save
    respond_to do |format|
      format.json { render :json => {:event => @newEvent} }
    end
    @newEventItin = EventItinerary.new itin_params
    @newEventItin.save
    respond_to do |format|
      format.json { render :json =>{:event_itineraries => @newEventItin}}
    end
  end 
  private
  def itin_params
    params.require(:itineraries).permit(:user_id)
  end
end
