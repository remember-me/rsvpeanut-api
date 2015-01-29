require 'rails_helper'

RSpec.describe "gets events" do
  xit "has a key name" do 
    @params = {city: "Austin", radius: "2"}
    @events = Event.run_eventbrite_query(@params)
    @events.should have_key :name
  end
  it "has a key location"
  it "has a key event_start"
  it "has a key event_url"
  it "has a key source"
end

RSpec.describe Event, :type => :model do
  it "is invalid without a name"
  it "is invalid without a location"
  it "is invalid without an event_start"
  it "is invalid without an event_url"
  it "is invalid without a source"
end



# describe "Events API" do
#   describe "GET /eventsapi" do
#     xit "returns all events by zipcode" do
      
#       events_params = {
#         "zipcode" => "78701",
#         "distance" => "5"
#       }
#       get 'movies', {}, { "Accept" => "application/json" }

#       expect(response.status).to eq 200

#       body = JSON.parse(response.body)
#       movie_titles = body.map { |m| m["title"] }

#       expect(movie_titles).to match_array(["The Lord of the Rings",
#                                            "The Two Towers"])
#     end
#   end
# end




# name: 'Good ole Hodown',
#   event_type: 'Party',
#   location: '123 Austin St',
#   event_start: 1422461610,
#   event_end: 1422461620,
#   attendees: 50,
#   cost: 3.40,
#   long: '-97.742105',
#   lat: '30.269873',
#   description: 'old fashioned fun',
#   event_url: 'http://www.meetup.com/austinrb/events/219854095/',
#   source: 'meetup'