class ChangeCoordsType < ActiveRecord::Migration
  def change
    remove_column :events, :coords
    add_column :events, :lat, :string
    add_column :events, :long, :string
  end
end
