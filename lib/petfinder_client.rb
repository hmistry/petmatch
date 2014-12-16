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

      return nil if json_invalid? || @json["petfinder"]["shelters"]["shelter"].nil?

      clean_json(ShelterCleaner.new, @json["petfinder"]["shelters"]["shelter"])
      @json["petfinder"]["shelters"]["shelter"]
    end

    def get_pets(shelter_id)
      api_get("/shelter.getPets", {id: shelter_id})

      return nil if json_invalid? || @json["petfinder"]["pets"]["pet"].nil?

      clean_json(PetCleaner.new, @json["petfinder"]["pets"]["pet"])
      @json["petfinder"]["pets"]["pet"]
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
