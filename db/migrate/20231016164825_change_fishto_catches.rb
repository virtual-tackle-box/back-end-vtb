class ChangeFishtoCatches < ActiveRecord::Migration[7.0]
  def change
    rename_table :fish, :catches 
    add_column :catches, :spot_name, :string
    add_column :catches, :latitude, :float
    add_column :catches, :longitude, :float
    add_column :catches, :lure, :string
    add_column :catches, :photo_url, :string
  end
end
