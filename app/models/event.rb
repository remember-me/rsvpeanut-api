class Event < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :event_itineraries
end
