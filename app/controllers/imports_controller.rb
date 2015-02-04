class ImportsController < ApplicationController
  def index
    @import = Import.new
  end

  def create
    zip = Import.new(import_params)

    if zip.valid?
      flash[:notice] = import_shelters_and_pets
    else
      flash[:error] = "Invalid Zipcode"
    end

    redirect_to imports_path
  end

  private
    def import_params
      params.require(:import).permit(:zipcode)
    end

    def import_shelters_and_pets
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

      return msg
    end
end
