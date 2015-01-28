class AddUrl < ActiveRecord::Migration
  def change
    add_column :events, :event_url, :string
    add_column :events, :source, :string
  end
end
