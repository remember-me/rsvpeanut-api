class RenameUtc < ActiveRecord::Migration
  def change
    rename_column :events, :UTC_start, :utc_start
    rename_column :events, :UTC_end, :utc_end
  end
end
