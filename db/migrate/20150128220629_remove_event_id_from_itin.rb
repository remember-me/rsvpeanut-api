class RemoveEventIdFromItin < ActiveRecord::Migration
  def change
    remove_column :intineraries, :event_id
  end
end
