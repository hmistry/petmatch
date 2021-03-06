class ShelterImporter
  def initialize(api_key)
    @api_key = api_key
  end

  def nearby_zipcodes
    @nearby_zipcodes ||= []
  end

  def shelters_imported
    @shelters_imported ||= []
  end

  def import(zipcode)
    shelters = fetch_shelters(zipcode)
    return [] if shelters.nil?
    shelters = [shelters] if shelters.is_a?(Hash)

    shelters.each do |shelter|
      if shelter["zip"] == zipcode
        save_shelter(shelter)
      else
        nearby_zipcodes.push(shelter["zip"]) if zip_exists(shelter["zip"])
      end
    end

    shelters_imported
  end

private
  def save_shelter(shelter)
    s = Shelter.find_or_initialize_by(shelter)
    unless s.persisted?
      shelters_imported.push(shelter["id_pf"]) if s.save
    end
  end

  def petfinder
    @petfinder ||= Petfinder::Client.new(@api_key)
  end

  def fetch_shelters(zipcode)
    petfinder.find_shelters(zipcode)
  end

  def zip_exists(zipcode)
    Shelter.where(zip: zipcode).count == 0
  end
end
