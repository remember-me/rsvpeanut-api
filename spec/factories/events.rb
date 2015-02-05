FactoryGirl.define do
  factory :event do
    name 'Party'
    event_type 'Social'
    location
    utc_start
    utc_end
    attendees
    cost
    updated_at
    created_at
    description
    lat
    long
    event_url
    source
    date_start
    date_end
    time_start
    time_end
    venue
  end
  
 #  factory :meetup do
#     code 200
# #     headers {:content_type => "applicatio/json"}
#     body {
#       "results"=>
#         [
#           {
#             "rsvp_limit"=>7, 
#             "status"=>"upcoming", 
#             "visibility"=>"public", 
#             "maybe_rsvp_count"=>0, 
#             "id"=>"219607523", 
#             "utc_offset"=>-21600000, 
#             "distance"=>3.4828543663024902, 
#             "time"=>1423094400000, 
#             "waitlist_count"=>0, 
#             "updated"=>1422527888000, 
#             "yes_rsvp_count"=>9, 
#             "created"=>1420429080000, 
#             "event_url"=>"http://www.meetup.com/Austin-Social-With-A-Twist/events/219607523/", 
#             "description"=>"<p><img src=\"http://theabgb.com/wp-content/uploads/2013/09/rainbowabgb1-946x360.jpg\" /></p> <p>Beer and Food focused on craft and quality.  Let's try it!!! Let's go to ABGB where beer makes everything better.  And stick around for a Rockabilly band (separate night) for a night of good food and vintagesque vibes. See you there :)</p> <p><br/><img src=\"http://austinot.com/wp-content/uploads/2014/02/abgb5.jpg\" /></p>", "name"=>"HH and Night @ ABGB", 
#             "headcount"=>0, 
#             "group"=>
#               {
#                 "id"=>11739912, 
#                 "created"=>1388778605000, 
#                 "group_lat"=>30.219999313354492, 
#                 "name"=>"Austin: Social With a Twist", 
#                 "group_lon"=>-97.75, 
#                 "join_mode"=>"open", 
#                 "urlname"=>"Austin-Social-With-A-Twist", 
#                 "who"=>"Austinophiles"
#               }
#           }, 
#           {
#             "status"=>"upcoming", 
#             "visibility"=>"public", 
#             "maybe_rsvp_count"=>0, 
#             "venue"=>
#               {
#                 "id"=>863361, 
#                 "zip"=>"78702", 
#                 "phone"=>"512.745.7076", 
#                 "lon"=>-97.701489, 
#                 "repinned"=>false, 
#                 "name"=>"Space12", 
#                 "state"=>"TX", 
#                 "address_1"=>"3121 E. 12th Street", 
#                 "lat"=>30.276457, 
#                 "city"=>"Austin", 
#                 "country"=>"us"
#               }, 
#             "id"=>"gftgflytdbgb", 
#             "utc_offset"=>-21600000, 
#             "distance"=>2.487607479095459, 
#             "time"=>1423098000000, 
#             "waitlist_count"=>0, 
#             "updated"=>1422675114000, 
#             "yes_rsvp_count"=>3, 
#             "created"=>1422670581000, 
#             "event_url"=>"http://www.meetup.com/creatorsnight/events/220200771/", 
#             "description"=>"<p>Featuring...</p> <p>Music: <a href=\"http://www.thehollands.org/\">The Hollands!</a> - Art: <a href=\"http://www.artofgent.com/\">Gent</a> - Startup: <a href=\"http://www.sillyangelcards.com\">SillyAngel Cards</a> - Photography: <a href=\"http://www.holpphotography.com/\">Mike Holp</a> - Videography: <a href=\"http://thestreetsaremine.com/\">Daniel LaFata</a> <br/>YOU: Share your art with open mic, <a href=\"http://www.instagram.com/barteratx\">bARTer</a> table, idea contest, and more.</p> <p>RSVP at <a href=\"http://www.zaplings.com/creatorsnight\">zaplings.com/creatorsnight</a> and we'll suggest people for you to meet at the event - people who share your passion or offer what you're looking for.</p>", "name"=>"Let's celebrate what we create!", 
#             "headcount"=>0, 
#             "group"=>
#               {
#                 "id"=>18380599, 
#                 "created"=>1422278375000, 
#                 "group_lat"=>30.270000457763672, 
#                 "name"=>"Zaplings presents Creators' Night", 
#                 "group_lon"=>-97.73999786376953, 
#                 "join_mode"=>"open", 
#                 "urlname"=>"creatorsnight", 
#                 "who"=>"creators"
#               }
#           }
#         ]    
# 
#     end
    
  end