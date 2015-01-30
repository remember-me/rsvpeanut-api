class Intinerary < ActiveRecord::Base
  has_many :user_ids, through: :user
end
