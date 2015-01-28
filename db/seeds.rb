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
    event_start: 1422461610,
    event_end: 1422461620,
    attendees: 50,
    cost: 3.40,
    long: '-97.742105',
    lat: '30.269873',
    description: 'old fashioned fun',
    event_url: 'http://www.meetup.com/austinrb/events/219854095/',
    source: 'meetup'
  }
])

User.create([
  {
    username: 'peter',
    password: 'password'
  }
])

