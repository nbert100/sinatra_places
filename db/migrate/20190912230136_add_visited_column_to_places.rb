class AddVisitedColumnToPlaces < ActiveRecord::Migration
  #creates an instance of migration class and calls add_column which is inherited from ActiveRecord
  def change
    add_column :places, :visited, :boolean, :default => false
  end
end
