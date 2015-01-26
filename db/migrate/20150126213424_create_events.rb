class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :event_type
      t.string :location
      t.datetime :event_start
      t.datetime :event_end
      t.integer :attendees
      t.float :cost

      t.timestamps null: false
    end
  end
end
