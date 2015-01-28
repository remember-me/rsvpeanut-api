module API
  class EventsController
    #will need post permissions for all data, need to see how to have ember send us the json and how we can accept it from a single source.
    #possible use of auth?
  end
  class EventItinerariesController
    #join table
  end
  class UsersController
    #will accept post and get requests. stores info
    #will need to read up on devise and how it handles said requests.
  end
  class ItinerariesController
    eventList = Intineraries.where( user_id: params[:user_id])
    render json: eventList, status: 200
    #will be for get requests.
  end
end