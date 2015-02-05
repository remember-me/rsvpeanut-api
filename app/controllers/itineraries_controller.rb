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

    @eventArray = event_array
    @eventArray.each do |event|
      event = Event.new(event)  #iterate through, add event itinerary to each one with itinerary ID from first save.
      event.save
      @newEventItin = EventItinerary.new(:event_id => event[:id],:itinerary_id => @newItinerary[:id])
      @newEventItin.save
    end
    
    respond_to do |format|
      format.json { render :json => [{:event => @eventArray},{ :itineraries => @newItinerary},{:event_itineraries => @newEventItin} ]}
    end
  end 
  private
  def event_params    
    params.permit(:name, :event_type, :location, :utc_start, :utc_end, :description, :lat, :long, :event_url,:attendees,:cost,:source,:date_start,:date_end,:time_start,:time_end,:venue)
  end
  def itin_params
    params.permit(:user_id)#need to change to whats in params.
  end
  def event_array
    params.permit(event: [:name, :event_type, :location, :utc_start, :utc_end, :description, :lat, :long, :event_url,:attendees,:cost,:source,:date_start,:date_end,:time_start,:time_end,:venue]).require(:event)
  end
end