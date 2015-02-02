class Event < ActiveRecord::Base
  belongs_to :itineraries
  belongs_to :event_itineraries

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
      start = e['start']['local'].to_datetime if e['start']
      end_time = e['end']['local'].to_datetime if e['end']
      description = e['description']['text'] if e['description']
      lat = e['venue']['address']['latitude'].to_f if e['venue']['address'] && e['venue']
      long = e['venue']['address']['longitude'].to_f if e['venue']['address'] && e['venue']
      {
        name: name,
        event_type: category,
        location: address,
        event_start: start,
        event_end: end_time,
#       no data for number of attendees this is for max attendees e['capacity']
        description: description,
        lat: lat,
        long: long,
        event_url: e['url'],
        source: 'eventbrite'
      }

    end
    data
  end

  def self.run_meetup_query params = { zipcode: '78701', radius: '2'}
    event_categories = [
      0,              'Arts',         'Business',
      'Auto',         'Community',    'Dancing',
      'Education',    7,              'Fashion',
      'Fitness',      'Food & Drink', 'Games',
      'LGBT',         'Movements',    'Well-being',
      'Crafts',       'Languages',    'Lifestyle',
      'Literature',   19,             'Films',
      'Music',        'Spirituality', 'Outdoors',
      'Paranormal',   'Moms & Dads',  'Pets',
      'Photography',  'Beliefs',      'Sci fi',
      'Singles',      'Social',       'Sports',
      'Support',      'Tech',         'Women'
      ]

    url = "https://api.meetup.com/2/open_events?status=upcoming&radius=#{params[:radius]}&and_text=False&limited_events=False&desc=False&offset=0&photo-host=public&format=json&zip=#{params[:zipcode]}&page=20&sig_id=182809685&sig=1c6a45863c09b08ea6c419a14ab34c7ce2c9d17a"

    if params[:category]
      category_index = event_categories.find_index(params[:category]).to_s
      url = "https://api.meetup.com/2/open_events?status=upcoming&radius=#{params[:radius]}&category=#{category_index}&and_text=False&limited_events=False&desc=False&offset=0&photo-host=public&format=json&zip=#{params[:zipcode]}&page=20&sig_id=182809685&sig=35aa9e882e201c5b9b672c1fad17da2376f1a208"
    end

    response = Unirest.get(url, headers: {'Accept' => 'application/json'})
    if response.body['results']
      data = response.body['results'].map do |e|
        address = e['venue']['address_1'] if e['venue']
        lat = e['venue']['lat'].to_f if e['venue']
        lon = e ['venue']['lon'].to_f if e['venue']
        start = Time.at(e['time']).to_datetime
        end_time = Time.at(e['time'] + e['duration']).to_datetime if e['time'] && e['duration']

        {
          attendees: e['yes_rsvp_count'],
          description: e['description'],
          event_end: end_time,
          event_start: start,
          event_type: params[:category],
          event_url: e['event_url'],
          location: address,
          lat: lat,
          long: lon,
          name: e['name'],
          source: 'meetup'
        }
      end
    return data
    end
  end

  def self.run_songkick_query params = { lat: 30.269560, lon: -97.742420 }
#     this gets all of the location ids to query for events
    url = 'http://api.songkick.com/api/3.0/events.json?location=geo:30.269560,-97.742420&apikey=xmhR3tz3sm5O55Xw'
    response = Unirest.get(url, headers: {'Accept' => 'application/json'})
    events = response.body['resultsPage']['results']['event']
      .map do |event|
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
      # url = "http://api.songkick.com/api/3.0/metro_areas/9171/calendar.json?apikey=xmhR3tz3sm5O55Xw"
      # result = Event.run_songkick_query
      # url = "http://api.songkick.com/api/3.0/search/locations.json?location=geo:#{30.269560},#{-97.742420}&apikey=xmhR3tz3sm5O55Xw"
      # url = "http://api.songkick.com/api/3.0/metro_areas/#{ids.first}/calendar.json?apikey=xmhR3tz3sm5O55Xw"
      # data = Unirest.get(url, headers: {'Accept' => 'application/json'})
      #         .body['resultsPage']['results']['event']
      # data = data.map do |query|
      #   query.body['resultsPage']['results']['event']
      # end
  end

end
