class Pet
  include Mongoid::Document
  # ["options", "breeds", "shelterPetId", "status", "name", "contact", "description", "sex", "age", "size", "mix", "shelterId", "lastUpdate", "media", "animal", "id_pf"]

  field :id_pf, type: String
  field :shelter_pet_id_pf, type: String
  field :shelter_id_pf, type: String

  field :name, type: String
  field :contact, type: String

end
