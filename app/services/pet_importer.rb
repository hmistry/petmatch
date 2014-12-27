class PetImporter
  def initialize(api_key)
    @api_key = api_key
    @imported_count = 0
  end

  def imported_count
    @imported_count
  end

  def import(shelter_ids)
    shelter_ids.each do |shelter_id|
      pets = fetch_pets(shelter_id)
      next if pets.nil?

      shelter = Shelter.where(id_pf: shelter_id).first
      pets = [pets] if pets.is_a?(Hash)

      pets.each do |pet|
        save_pet(pet, shelter)
      end
    end
  end

private
  def save_pet(pet, shelter)
    animal = get_animal(pet)
    options = get_options(pet)
    breeds = get_breeds(pet, animal)
    p = Pet.find_or_initialize_by(pet)

    unless p.persisted?
      p.shelter = shelter
      p.animal = animal
      p.options = options
      p.breeds = breeds
      @imported_count += 1 if p.save
    end
  end

  def petfinder
    @petfinder ||= Petfinder::Client.new(@api_key)
  end

  def fetch_pets(shelter_id)
    petfinder.get_pets(shelter_id)
  end

  def extract(pet, key)
    pet.delete(key)
  end

  def get_animal(pet)
    Animal.const_get(extract(pet, "animal").upcase)
  end

  def get_options(pet)
    return nil if pet["options"]["option"].nil?
    opts = extract(pet, "options")

    if opts["option"].is_a?(Array)
      return opts["option"].map { |opt| Option.find_or_create_by(name: opt)}
    else
      return [Option.find_or_create_by(name: opts["option"])]
    end
  end

  def get_breeds(pet, animal)
    return nil if pet["breeds"]["breed"].nil?
    breeds = extract(pet, "breeds")

    if breeds["breed"].is_a?(Array)
      return breeds["breed"].map { |breed| Breed.find_or_create_by(type: breed, animal: animal)}
    else
      return [Breed.find_or_create_by(type: breeds["breed"], animal: animal)]
    end
  end
end
