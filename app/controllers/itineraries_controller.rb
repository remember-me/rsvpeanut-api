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
    @newItinerary = Itinerary.new itin_params#change to what is in :id
    @newItinerary.save
    respond_to do |format|
      format.json { render :json =>{ :itineraries => @newItinerary}}
    end
    @newEvent = Event.new event_params #iterate through
    @newEvent.save
    respond_to do |format|
      format.json { render :json => {:event => @newEvent} }
    end
    @newEventItin = EventItinerary.new(params[:id]) #pull each event_id and itinerary_id.
    @newEventItin.save
    respond_to do |format|
      format.json { render :json =>{:event_itineraries => @newEventItin}}
    end
  end 
  private
  def event_params    
    params.require(:event).permit(:name, :event_type, :location, :utc_start, :utc_end, :description, :lat, :long, :event_url,:attendees,:cost,:source,:date_start,:date_end,:time_start,:time_end,:venue)
  end
  def itin_params
    params.permit(:user_id)#need to change to whats in params.
  end
end
