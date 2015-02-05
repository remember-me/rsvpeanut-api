require 'byebug'
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

    @eventArray = event_array#unpermitted parameters
    @eventArray.each do |event|
      event = Event.new(event)  #iterate through

      event.save
    end

    @newEventItin = EventItinerary.new(params[:id])#is not pulling in the returned itin ID or event ID.
    @newEventItin.save
    
    respond_to do |format|
      format.json { render :json => [{:event => @newEvent},{ :itineraries => @newItinerary},{:event_itineraries => @newEventItin} ]}
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
