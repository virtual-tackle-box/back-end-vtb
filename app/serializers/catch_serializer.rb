class CatchSerializer
  include Rails.application.routes.url_helpers
  include JSONAPI::Serializer
  attributes :species, 
              :weight, 
              :length, 
              :spot_name, 
              :latitude, 
              :longitude, 
              :lure,
              :cloudinary_urls
end