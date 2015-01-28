class AddFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :coords, :float
    add_column :events, :description, :string
  end
end
