class EventItinerary < ActiveRecord::Base
  belongs_to :intinerary
  belongs_to :event
end
