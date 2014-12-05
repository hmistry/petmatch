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

      pets.each do |pet|
        save_pet(pet)
      end
    end
  end

private
  def save_pet(pet)
    p = Pet.find_or_initialize_by(pet)
    unless p.persisted?
      p.save
      @imported_count += 1
    end
  end

  def petfinder
    @petfinder ||= Petfinder::Client.new(@api_key)
  end

  def fetch_pets(shelter_id)
    petfinder.get_pets(shelter_id)
  end
end
