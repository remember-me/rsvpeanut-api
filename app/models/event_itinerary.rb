class EventItinerary < ActiveRecord::Base
  belongs_to :itineraries
  belongs_to :event
end
