class CreateNearestStations < ActiveRecord::Migration[5.2]
  def change
    create_table :nearest_stations do |t|
      t.string :transit_name
      t.string :station_name
      t.integer :walk_fraction
      t.references :property_information, foreign_key: true
      t.timestamps
    end
  end
end
