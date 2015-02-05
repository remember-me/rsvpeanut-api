# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.create([
  {
    name: 'Good ole Hodown',
    event_type: 'Party',
    location: '123 Austin St',
    utc_start: 1422461610,
    utc_end: 1422461620,
    attendees: 50,
    cost: 3.40,
    long: '-97.742105',
    lat: '30.269873',
    description: 'old fashioned fun',
    event_url: 'http://www.meetup.com/austinrb/events/219854095/',
    source: 'meetup',
    date_start: 'null',
    date_end: 'null',
    time_start: 'null',
    time_end: 'null',
    venue: 'Bucks country grill'
  }
])
Event.create([
  {
    name: 'Bad ole Hodown',
    event_type: 'Party',
    location: '125 Austin St',
    utc_start: 1422461610,
    utc_end: 1422461620,
    attendees: 35,
    cost: 5.00,
    long: '-97.742105',
    lat: '30.269873',
    description: 'bad fashioned fun',
    event_url: 'http://www.meetup.com/austinrb/events/219854095/',
    source: 'eventbrite',
    date_start: 'null',
    date_end: 'null',
    time_start: 'null',
    time_end: 'null',
    venue: 'Bucks county grill'
  }
])
Event.create([
  {
    name: 'Super awesome drunk stuff',
    event_type: 'Art show',
    location: '127 Austin St',
    utc_start: 1422461610,
    utc_end: 1422461620,
    attendees: 37,
    cost: 5.00,
    long: '-97.742105',
    lat: '30.269873',
    description: 'bad fashioned fun',
    event_url: 'http://www.meetup.com/austinrb/events/219854095/',
    source: 'songkick',
    date_start: 'null',
    date_end: 'null',
    time_start: 'null',
    time_end: 'null',
    venue: 'Mohawk'
  }
])
Event.create([
  {
    name: 'Super awesome drunk stuff part 2',
    event_type: 'Art show',
    location: '127 Austin St',
    utc_start: 1422461610,
    utc_end: 1422461620,
    attendees: 37,
    cost: 5.00,
    long: '-97.742105',
    lat: '30.269873',
    description: 'bad fashioned fun',
    event_url: 'http://www.meetup.com/austinrb/events/219854095/',
    source: 'songkick',
    date_start: 'null',
    date_end: 'null',
    time_start: 'null',
    time_end: 'null',
    venue: 'Bucks country grill'
  }
])
User.create([
  {
    first: 'Peter',
    last: 'James',
    email: 'peter@gmail.com',
    password: 'password'
  }
])
User.create([
  {
    first: 'James',
    last: 'Peter',
    email: 'james@gmail.com',
    password: 'password'
  }
])
User.create([
  {
    first: 'John',
    last: 'Goldsmith',
    email: 'john@gmail.com',
    password: 'password'
  }
])
User.create([
  {
    first: 'Judas',
    last: 'Iscariot',
    email: 'judas@gmail.com',
    password: 'password'
  }
])
Itinerary.create([
    {
        user_id:1
    }
    ])
Itinerary.create([
    {
        user_id:2
    }
    ])
Itinerary.create([
    {
        user_id:3
    }
    ])
