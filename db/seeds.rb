ANIMALS = %w(Barnyard Bird Cat Dog Horse Pig Rabbit Reptile Smallflurry)
ANIMALS.each { |animal| Animal.create(type: animal) }
