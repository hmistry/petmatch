class Pet
  include Mongoid::Document
  # ["options", "breeds", "shelterPetId", "status", "name", "contact", "description", "sex", "age", "size", "mix", "shelterId", "lastUpdate", "media", "animal", "id_pf"]

  field :id_pf, type: String
  field :shelter_pet_id_pf, type: String
  field :shelter_id_pf, type: String

  field :name, type: String
  field :contact, type: String
  field :options, type: String #h_m
  field :breeds, type: String #h_m
  field :status, type: String #h_o
  field :description, type: String
  field :sex, type: String #h_o
  field :age, type: String
  field :size, type: String #h_o
  field :mix, type: String
  field :animal, type: String #h_o

  belongs_to :shelter

  validates :shelter, presence: true
end
