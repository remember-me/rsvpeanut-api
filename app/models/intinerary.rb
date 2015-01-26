class Intinerary < ActiveRecord::Base
  has_many :user_ids, :through :user
  has_many :event_ids, :through :event
end
