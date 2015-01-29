class User < ActiveRecord::Base
  has_many :itinerary
  def self.create_user
    response = Unirest.post()
    data = response.body
  end

end
# http://localhost:3000/users/create/5?first=Shit