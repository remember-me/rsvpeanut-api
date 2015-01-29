class Event < ActiveRecord::Base
  
  
  belongs_to :itinerary
  belongs_to :event_itineraries
  
  @eventbrite_token = 'DUE3OBAFNHYCQEN5E3VV'
  
  def self.run_eventbrite_query params
#     hard coded an address in, it should be changed later
#     this method maps the local time to the data array
    url = 'https://www.eventbriteapi.com/v3/events/search/?location.address=' + params[:address] + '&location.within=' + params[:radius] + '&venue.city=' + params[:city] + '&token=DUE3OBAFNHYCQEN5E3VV'
    
    response = Unirest.get(url, headers: { "Accept" => "application/json" }, parameters: nil, auth:nil)
    data = response.body['events'].map do |e|
      category = e['category']['short_name'] if e['category']
      name = e['name']['text'] if e['name']
      address = e['venue']['address']['address_1'] if e['venue'] && e['venue']['address']
      start = e['start']['local'] if e['start']
      end_time = e['end']['local'] if e['end']
      description = e['description']['text'] if e['description']
      lat = e['venue']['address']['latitude'].to_f if e['venue']['address'] && e['venue']
      long = e['venue']['address']['longitude'].to_f if e['venue']['address'] && e['venue']
      {
        name: name,
        event_type: category,
        location: address,
        event_start: start,
        event_end: end_time,
#         no data for number of attendees this is for max attendees e['capacity']
        description: description,
        lat: lat,
        long: long,
        event_url: e['url']
      }
        
    end
    data
  end
    
end
