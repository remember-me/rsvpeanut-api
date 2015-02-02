class ItinerariesController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def index
    @itineraryList = Intineraries.all
    render json: @itineraryList, status: 200
  end
  def show
    @showItin = Intineraries.find(itin_params)
    render json: @showItin, status: 200
  end
  def create
    @newItinerary = Intineraries.new itin_params
    respond_to do |format|
      format.json { render :json => @newItinerary}
    end
  end 
  private
  def itin_params
    params.require(:itinerary).permit(:user_id)
  end
end
