class CreateIntineraries < ActiveRecord::Migration
  def change
    create_table :intineraries do |t|
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps null: false
    end
    add_foreign_key :intineraries, :users
    add_foreign_key :intineraries, :events
  end
end
