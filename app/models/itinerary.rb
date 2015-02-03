class Itinerary < ActiveRecord::Base
  has_many :user_ids, through: :user
end
