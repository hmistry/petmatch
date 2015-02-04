class ImportsController < ApplicationController
  def index
    @import = Import.new
  end

  def create
    # Implemented this way for simplicity. In production, will be implemented using delayed job.
    shelters_importer = ShelterImporter.new(petfinder_api_key)
    shelters = shelters_importer.import(import_params["zipcode"])

    if shelters.count == 0
      msg = "Try these zipcodes: #{shelters_importer.nearby_zipcodes.uniq.join(", ")}"
    else
      pets_importer = PetImporter.new(petfinder_api_key)
      pets_importer.import(shelters)

      msg = "#{pets_importer.imported_count} pets in #{shelters.count} shelters were successfully imported."
    end

    redirect_to imports_path, notice: msg
  end

  private
    def import_params
      params[:import]
    end
end
