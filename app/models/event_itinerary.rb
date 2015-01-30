class EventItinerary < ActiveRecord::Base
  belongs_to :intineraries
  belongs_to :event
end
