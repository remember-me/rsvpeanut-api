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
    respond_to do |format|
      format.json { render :json =>{ :itineraries => @newItinerary}}
    end
  end 
  private
  def itin_params
    params.require(:itineraries).permit(:user_id)
  end
end
