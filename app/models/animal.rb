class Animal
  include Mongoid::Document

  ANIMALS = %w(Barnyard Bird Cat Dog Horse Pig Rabbit Reptile Smallflurry)

  ANIMALS.each { |animal| Animal.const_set(animal.upcase, Animal.where(type: animal).first) }

  field :type, type: String

  has_many :breeds
  has_many :pets

  validates :type, inclusion: ANIMALS
end
