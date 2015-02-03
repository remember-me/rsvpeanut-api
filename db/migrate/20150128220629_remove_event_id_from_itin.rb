class RemoveEventIdFromItin < ActiveRecord::Migration
  def change
    remove_column :itineraries, :event_id
  end
end
