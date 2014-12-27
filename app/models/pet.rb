class Pet
  include Mongoid::Document
  # ["options", "breeds", "shelterPetId", "status", "name", "contact", "description", "sex", "age", "size", "mix", "shelterId", "lastUpdate", "media", "animal", "id_pf"]

  GENDERS = %w(M F U)
  SIZES = %w(S M L XL)
  STATUSES = %w(A H P X)
  AGES = %w(Baby Young Adult Senior)
  MIX = %w(yes no)

  field :id_pf, type: String
  field :shelter_pet_id_pf, type: String
  field :name, type: String
  field :contact, type: String
  field :status, type: String
  field :description, type: String
  field :sex, type: String
  field :age, type: String
  field :size, type: String
  field :mix, type: String

  belongs_to :shelter
  belongs_to :animal

  has_and_belongs_to_many :options
  has_and_belongs_to_many :breeds

  validates :shelter, :name,  presence: true

  validates :mix, inclusion: MIX
  validates :sex, inclusion: GENDERS
  validates :age, inclusion: AGES
  validates :status, inclusion: STATUSES
  validates :size, inclusion: SIZES
end
