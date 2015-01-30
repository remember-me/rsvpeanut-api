class User < ActiveRecord::Base
  has_many :itineraries
  def create## this may not be needed.
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
