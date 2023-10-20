class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :catches, :lures, :phone_number

  has_many :lures
  has_many :catches
end
