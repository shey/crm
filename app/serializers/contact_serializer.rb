class ContactSerializer
  include JSONAPI::Serializer

  attributes :name, :email, :tags
end
