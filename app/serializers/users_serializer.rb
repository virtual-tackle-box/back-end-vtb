class UsersSerializer
  include JSONAPI::Serializer
  attributes :email, :password, :fish, :lures
end
