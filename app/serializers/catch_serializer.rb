class CatchSerializer
  include JSONAPI::Serializer
  attributes :species, 
              :weight, 
              :length, 
              :spot_name, 
              :latitude, 
              :longitude, 
              :lure, 
              :photo_url
end