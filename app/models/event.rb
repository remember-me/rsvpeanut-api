class Event < ActiveRecord::Base
  belongs_to :itineraries
  belongs_to :event_itineraries

  def self.retrieve_eventbrite_events
    params = {
       zipcode: '60152',
       lat: 42.2508,
       lon: -88.6050,
       radius: '15',
       page: 1
       }
    results = []
    initial_response = Event.run_eventbrite_query params
    page_count = initial_response.body['pagination']['page_count'].to_i
    results.push Event.parse_eventbrite_data initial_response
    if  page_count > 1
      (2..page_count).each do |x|
        params[:page] = x
        results.push Event.parse_eventbrite_data Event.run_eventbrite_query params
      end
    end
    return results.flatten
  end

  def self.parse_eventbrite_data unirest_object
        data = unirest_object.body['events'].map do |e|
          category = e['category']['short_name'] if e['category']
          name = e['name']['text'] if e['name']
          address = e['venue']['address']['address_1'] if e['venue'] && e['venue']['address']
          start = e['start']['local'].to_datetime if e['start']
          end_time = e['end']['local'].to_datetime if e['end']
          description = e['description']['text'] if e['description']
          lat = e['venue']['address']['latitude'].to_f if e['venue']['address'] && e['venue']
          lon = e['venue']['address']['longitude'].to_f if e['venue']['address'] && e['venue']
          {
            attendees: nil,
            description: description,
            event_type: category,
            event_url: e['url'],
            location: address,
            lat: lat,
            long: lon,
            name: name,
            source: 'eventbrite',
            date_start: nil,
            date_end: nil,
            time_start: nil,
            time_end: nil,
            utc_start: start,
            utc_end: end_time,
            venue: nil
          }

        end
        data
  end

  def self.run_eventbrite_query params
    url = 'https://www.eventbriteapi.com/v3/events/search/'
    eventbrite_token ='DUE3OBAFNHYCQEN5E3VV'
    response = Unirest.get(url, headers: { "Accept" => "application/json" },
      parameters: {
        'location.latitude' => params[:lat].to_s,
        'location.longitude' => params[:lon].to_s,
        'location.within' => params[:radius] + 'mi',
        'token' => eventbrite_token,
        'page' => params[:page]
        })
  end

  def self.retrieve_all_meetup_categories
    url = "https://api.meetup.com/2/categories"
    event_categories = Unirest.get(url,
      headers: {'Accept' => 'application/json'},
      parameters: {
        'key' => '2e6f587c31252c43307b4f364215934',
        'order' => 'shortname',
        'desc' => 'false',
        'offset' => '0',
        'photo-host' => 'public',
        'format' => 'json',
        'page' => '40'
        }).body['results']
    results = event_categories.map do |cat|
      Event.run_meetup_query({
         zipcode: '78701',
         radius: '25',
         category: cat['name'],
         category_id: cat['id']
         })
    end
      .flatten
  end

  def self.run_meetup_query params
    url = "https://api.meetup.com/2/open_events"

    response = Unirest.get(url,
      headers: {'Accept' => 'application/json'},
      parameters: {
        'key' => '2e6f587c31252c43307b4f364215934',
        'category' => params[:category_id],
        'status' => 'upcoming',
        'radius' => params[:radius],
        'and_text' => 'False',
        'limited_events' => 'False',
        'desc' => 'False',
        'offset' => '0',
        'photo-host' => 'public',
        'format' => 'json',
        'zip' => params[:zipcode],
        'page' => '20'
        }).body['results']
    if response
      data = response.map do |e|
        address = e['venue']['address_1'] if e['venue']
        lat = e['venue']['lat'].to_f if e['venue']
        lon = e ['venue']['lon'].to_f if e['venue']
        time = (e['time'] + e['utc_offset'])/1000
        start = Time.at(time).to_datetime
        end_time = Time.at(e['time'] + e['duration']).to_datetime if e['time'] && e['duration']
        venue = e['venue']['name'] if e['venue']
        {
          attendees: e['yes_rsvp_count'],
          description: e['description'],
          event_type: params[:category],
          event_url: e['event_url'],
          location: address,
          lat: lat,
          long: lon,
          name: e['name'],
          source: 'meetup',
          date_start: nil,
          date_end: nil,
          time_start: nil,
          time_end: nil,
          utc_start: time,
          utc_end: nil,
          venue: venue
        }
      end
    return data
    end
  end

  def self.run_songkick_query params = { lat: 30.269560, lon: -97.742420 }
#     this gets all of the location ids to query for events
    url = 'http://api.songkick.com/api/3.0/events.json'
    lat = params[:lat].to_s
    lon = params[:lon].to_s
    response = Unirest.get(url,
      headers: {
        'Accept' => 'application/json'
        },
      parameters: {
        'location' => 'geo:' + lat + ',' + lon,
        'apikey' => 'xmhR3tz3sm5O55Xw'
        }
    ).body['resultsPage']['results']['event']

    events = response.map do |event|
        event['start']['datetime'] ? datetime = event['start']['datetime'].to_datetime : datetime = nil
        {
          attendees: nil,
          description: nil,
          event_type: event['type'],
          event_url: event['uri'],
          location: event['venue']['displayName'],
          lat: event['venue']['lat'],
          long: event['venue']['lng'],
          name: event['displayName'],
          source: 'songkick',
          date_start: event['start']['date'],
          date_end: nil,
          time_start: event['start']['time'],
          time_end: nil,
          utc_start: datetime,
          utc_end: nil,
          venue: event['venue']['displayName']
        }
      end
    return events
      # result = Event.run_songkick_query
  end

end
