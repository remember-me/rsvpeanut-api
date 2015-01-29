class User < ActiveRecord::Base
  has_many :itinerary
  def create
    response = Unirest.post()
    data = response.body['user'].map do |x|
      first = x['first']
      last = x['last']
      email = x['email']
      password = x['password']
      {
        first: first,
        last: last,
        email: email,
        password: password
      }
    end
    data
  end

end
