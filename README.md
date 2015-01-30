[![Stories in Ready](https://badge.waffle.io/remember-me/rsvpeanut-api.png?label=ready&title=Ready)](https://waffle.io/remember-me/rsvpeanut-api)
# RSVPeanut
  This backend is launched at http://rsvpeanut.herokuapp.com

 #                          Prefix Verb   URI Pattern                                                       Controller#Action
                           root GET    /                                                                 welcome#index
                         events GET    /events(.:format)                                                 events#index
                                POST   /events(.:format)                                                 events#create
                      new_event GET    /events/new(.:format)                                             events#new
                     edit_event GET    /events/:id/edit(.:format)                                        events#edit
                          event GET    /events/:id(.:format)                                             events#show
                                PATCH  /events/:id(.:format)                                             events#update
                                PUT    /events/:id(.:format)                                             events#update
                          users GET    /users(.:format)                                                  users#index
                                POST   /users(.:format)                                                  users#create
                       new_user GET    /users/new(.:format)                                              users#new
                      edit_user GET    /users/:id/edit(.:format)                                         users#edit
                           user GET    /users/:id(.:format)                                              users#show
                                PATCH  /users/:id(.:format)                                              users#update
                                PUT    /users/:id(.:format)                                              users#update
                eventsapi_index GET    /eventsapi(.:format)                                              eventsapi#index
                      eventsapi GET    /eventsapi/:id(.:format)                                          eventsapi#show
 new_intinerary_event_itinerary GET    /intineraries/:intinerary_id/event_itineraries/new(.:format)      event_itineraries#new
edit_intinerary_event_itinerary GET    /intineraries/:intinerary_id/event_itineraries/:id/edit(.:format) event_itineraries#edit
     intinerary_event_itinerary GET    /intineraries/:intinerary_id/event_itineraries/:id(.:format)      event_itineraries#show
                                DELETE /intineraries/:intinerary_id/event_itineraries/:id(.:format)      event_itineraries#destroy
                   intineraries GET    /intineraries(.:format)                                           intineraries#index
                                POST   /intineraries(.:format)                                           intineraries#create
                     intinerary GET    /intineraries/:id(.:format)                                       intineraries#show