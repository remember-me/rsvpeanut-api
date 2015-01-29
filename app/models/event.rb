class Event < ActiveRecord::Base
  
  
  belongs_to :itinerary
  belongs_to :event_itineraries
  
  @eventbrite_token = 'DUE3OBAFNHYCQEN5E3VV'
  
  def self.run_eventbrite_query params = {city: 'Austin', radius: '1mi'}
    if params[:address]
      url = 'https://www.eventbriteapi.com/v3/events/search/?location.address=' + params[:address] + '&location.within=' + params[:radius] + '&venue.city=' + params[:city] + '&token=DUE3OBAFNHYCQEN5E3VV'
    else
      url = 'https://www.eventbriteapi.com/v3/events/search/?venue.city=' + params[:city] + '&token=DUE3OBAFNHYCQEN5E3VV'
    end
    
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
  
  def self.run_meetup_query params
    url = 'https://api.meetup.com/2/open_events?status=upcoming&radius=' + params[:radius] + '&and_text=False&limited_events=False&desc=False&offset=0&photo-host=public&format=json&zip=78701&page=20&sig_id=184007427&sig=61b25af3b507ebd2c48cd8011bf4a21911caf633'
  end
  
  def self.run_songkick_query params
  end
  
end
