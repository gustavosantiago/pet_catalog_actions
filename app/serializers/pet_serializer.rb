class PetSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :breed, :description, :url, :adopted, :owner
end
