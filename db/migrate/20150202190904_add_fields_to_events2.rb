class AddFieldsToEvents2 < ActiveRecord::Migration
  def change
    rename_column :events, :event_start, :UTC_start
    rename_column :events, :event_end, :UTC_end
    add_column :events, :date_start, :string
    add_column :events, :date_end, :string
    add_column :events, :time_start, :string
    add_column :events, :time_end, :string
    add_column :events, :venue, :string
  end
end
