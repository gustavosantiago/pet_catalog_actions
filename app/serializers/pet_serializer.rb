class PetSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :breed, :description, :url
end
