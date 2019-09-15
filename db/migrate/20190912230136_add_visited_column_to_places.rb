class AddVisitedColumnToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :visited, :boolean, :default => false
  end
end
