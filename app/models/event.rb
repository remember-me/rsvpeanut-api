class Event < ActiveRecord::Base
<<<<<<< HEAD
  
  
  belongs_to :itineraries
=======
  belongs_to :itinerary
>>>>>>> master
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
#       no data for number of attendees this is for max attendees e['capacity']
        description: description,
        lat: lat,
        long: long,
        event_url: e['url']
      }
        
    end
    data
  end
  
  def self.run_meetup_query params = { zipcode: '78701', radius: '2'}
    event_categories = [0, 'Arts', 'Business', 'Auto', 'Community', 'Dancing', 'Education', 7, 'Fashion', 'Fitness', 'Food & Drink', 'Games', 'LGBT', 'Movements', 'Well-being', 'Crafts', 'Languages', 'Lifestyle', 'Literature', 19, 'Films', 'Music', 'Spirituality', 'Outdoors', 'Paranormal', 'Moms & Dads', 'Pets', 'Photography', 'Beliefs', 'Sci fi', 'Singles', 'Social', 'Sports', 'Support', 'Tech', 'Women']
    
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
        end_time = e['time'] + e['duration'] if e['time'] && e['duration']
        {
          name: e['name'],
          event_type: params[:category],
          location: address,
          event_start: e['time'],
          event_end: end_time,
          attendees: e['yes_rsvp_count'],
          description: e['description'],
          lat: lat,
          long: lon,
          event_url: e['event_url']
          
        }
      end
    return data
    end
  end
  
  def self.run_songkick_query params
  end
  
end
