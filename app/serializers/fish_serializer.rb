class FishSerializer
  include JSONAPI::Serializer
  attributes :species, :weight, :length
end