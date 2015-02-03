class ChangeIntinToItin < ActiveRecord::Migration
  def change
    rename_column :event_itineraries, :intinerary_id, :itinerary_id
  end
end
