class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :catches, :lures

  has_many :lures
  has_many :catches
end
