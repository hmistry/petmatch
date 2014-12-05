module Petfinder

  class Client
    include HTTParty
    base_uri 'api.petfinder.com'

    def initialize(api_key)
      @options = {key: nil, format: "json"}
      @options[:key] = api_key
      @json = nil
    end

    def find_shelters(zipcode)
      api_get("/shelter.find", {location: zipcode})

      json_shelters = @json["petfinder"]["shelters"]["shelter"]
      return nil if json_invalid? || json_shelters.nil?

      clean_json(ShelterCleaner.new, json_shelters)
      json_shelters
    end

    def get_pets(shelter_id)
      api_get("/shelter.getPets", {id: shelter_id})

      json_pets = @json["petfinder"]["pets"]["pet"]
      return nil if json_invalid? || json_pets.nil?

      clean_json(PetCleaner.new, json_pets)
      json_pets
    end

    def api_get(url, params)
      query = @options.merge(params)
      response = self.class.get(url, {query: query})
      @json = nil
      @json = JSON.parse(response.body) if response.code.to_i == 200
    end

    def json_status_code
      @json["petfinder"]["header"]["status"]["code"]["$t"].to_i
    end

    def json_invalid?
      @json.nil? || json_status_code != 100
    end

    def clean_json(cleaner, json)
      cleaner.clean_all(json)
    end
  end

end
