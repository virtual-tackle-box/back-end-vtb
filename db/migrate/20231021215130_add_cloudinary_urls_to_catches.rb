class AddCloudinaryUrlsToCatches < ActiveRecord::Migration[7.0]
  def change
    add_column :catches, :cloudinary_urls, :string
  end
end
