class CreateEventItineraries < ActiveRecord::Migration
  def change
    create_table :event_itineraries do |t|
      t.references :intinerary, index: true
      t.references :event, index: true

      t.timestamps null: false
    end
    add_foreign_key :event_itineraries, :intineraries
    add_foreign_key :event_itineraries, :events
  end
end
