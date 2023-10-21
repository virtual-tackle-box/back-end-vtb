class CatchSerializer
  include Rails.application.routes.url_helpers
  include JSONAPI::Serializer
  attributes :species, 
              :weight, 
              :length, 
              :spot_name, 
              :latitude, 
              :longitude, 
              :lure
  
  # def catch_images
  #   return unless object.catch_images.attached?

  #   object.catch_images.map do |catch_image|
  #     catch_image.blob.attributes
  #       .slice('filename', 'byte_size', 'id')
  #       .merge(url: catch_image_url(catch_image))
  #   end
  # end

  # def catch_image_url(image)
  #   rails_blob_path(image, only_path: true)
  # end
end