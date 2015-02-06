[![Stories in Ready](https://badge.waffle.io/remember-me/rsvpeanut-api.png?label=ready&title=Ready)](https://waffle.io/remember-me/rsvpeanut-api)
# RSVPeanut
  This backend is launched at http://rsvpeanut.herokuapp.com

## API Endpoints

# /events?=city%20state or /events?=zip_code

Pulls all events. Returned JSON is:

events: [
	{
		attendees: 50,
		description: "Concert by Laura Joy",
		cost: 5.00,
		event_type: "Concert",
		event_url: "http://www.songkick.com/concerts/22424658-laura-joy-at-trio-grill?utm_source=32298&utm_medium=partner",
		location: "Trio Grill",
		lat: 42.2486332,
		long: -88.6084269,
		name: "Laura Joy at Trio Grill (April 4, 2015)",
		source: "songkick",
		utc_start: "2015-04-04T19:30:00.000-05:00",
		utc_end: "2015-04-04T19:30:00.000-05:00",
		venue: "Trio Grill",
		id: "1"
	},
# /user

POST is a new user with JSON of:

 {"user":
 	{
 	"first":"firstname",
 	"last":"lastname",
 	"email":"email@email.com",
 	"password":"app123"
 	}
 }

 GET returns userinfo

{
user: [
	{
		id: 1,
		password: "password",
		created_at: "2015-02-05T19:15:29.657Z",
		updated_at: "2015-02-05T19:15:29.657Z",
		first: "Peter",
		last: "James",
		email: "peter@gmail.com"
	}
]	

# /itineraries

GET returns JSON of:
{
	itineraries: [
		{
		id: 1,
		user_id: 1,
		created_at: "2015-02-05T19:15:29.673Z",
		updated_at: "2015-02-05T19:15:29.673Z"
		}
	]
}

# /users/:id/itineraries

POST request should be formatted as:
{"event":
	[
		{
		"name": "Good ole Hodown",
		"event_type": "Party",
		"location": "123 Austin St",
		"utc_start": 1422461610,
		"utc_end": 1422461620,
		"attendees": 50,
		"cost": 3.40,
		"long": "-97.742105",
		"lat": "30.269873",
		"description": "old fashioned fun",
		"event_url": "http://www.meetup.com/austinrb/events/219854095/",
		"source": "meetup",
		"date_start": "null",
		"date_end": "null",
		"time_start": "null",
		"time_end": "null",
		"venue": "Bucks country grill"
		}
	]
}