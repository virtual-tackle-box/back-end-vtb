class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :fish, :lures

  has_many :lures
  # has_many :fish
end
