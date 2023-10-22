class Catch < ApplicationRecord
  validates :species, presence: true
  validates :spot_name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  
  belongs_to :user

    # Custom getter to deserialize cloudinary_urls
    def cloudinary_urls
      raw_value = read_attribute(:cloudinary_urls)
      JSON.parse(raw_value) if raw_value.present?
    end
  
    # Custom setter to serialize cloudinary_urls
    def cloudinary_urls=(values)
      serialized = values.to_json
      write_attribute(:cloudinary_urls, serialized)
    end
end