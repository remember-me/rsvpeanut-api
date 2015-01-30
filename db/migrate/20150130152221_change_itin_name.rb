class ChangeItinName < ActiveRecord::Migration
  def change
    rename_table :intineraries, :itineraries
  end
end
