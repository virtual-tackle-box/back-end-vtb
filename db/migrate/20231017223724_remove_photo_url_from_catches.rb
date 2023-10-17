class RemovePhotoUrlFromCatches < ActiveRecord::Migration[7.0]
  def change
    remove_column :catches, :photo_url, :string
  end
end
