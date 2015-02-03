require 'rails_helper'
require 'spec_helper'

describe Event do
  
  it 'responds to all method calls' do
    
    Event.should respond_to(:retrieve_all_meetup_categories) 
    Event.should respond_to(:run_meetup_query) 
    Event.should respond_to(:run_songkick_query) 
 end
 
 context '#run_eventbrite_query' do
    @event = Event.run_eventbrite_query({ address: '716 Congress Ave', city: 'Austin', radius: '1mi' })
    it 'responds to method call' do
      Event.should respond_to(:run_eventbrite_query)
    end
    
    it 'should return an object' do 
      @event.expect be_an_intstance_of?(Object) 
    end
    
    
    
    
    
  end
end 
    # @event = Event.run_eventbrite_query({city: "Austin", radius: '1mi'})
#     its(:name) { should_not be_nil }
#     its(:event_type) { should_not be_nil }
#     its(:location) { should_not be_nil }
#     its(:UTC_start) { should_not be_nil }
#     its(:UTC_end) { should_not be_nil }
#     its(:attendees) { should_not be_nil }
#     its(:cost) { should_not be_nil }
#     its(:created_at) { should_not be_nil }
#     its(:updated_at) { should_not be_nil }
#     its(:description) { should_not be_nil }
#     its(:event_url) { should_not be_nil }
#     its(:source) { should_not be_nil }
#     its(:lat) { should_not be_nil }
#     its(:long) { should_not be_nil }
#     its(:date_start) { should_not be_nil }
#     its(:date_end) { should_not be_nil }
#     its(:time_start) { should_not be_nil }
#     its(:time_end) { should_not be_nil }
#     its(:venue) { should_not be_nil }

  
#   before do
#     params = {city: "Austin", radius: "2"}
#     @events = Event.run_eventbrite_query(params)
#   end
  
# RSpec.describe Event, :type => :model do
#   fixtures :events
# 
#   it "is invalid without a name" do
#     Event.new(events(:one)).should be_valid
#   end
#   it "is invalid without a location"
#   it "is invalid without an event_start"
#   it "is invalid without an event_url"
#   it "is invalid without a source"
# end



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
