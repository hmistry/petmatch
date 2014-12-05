class ImportsController < ApplicationController
  def index
    @import = Import.new
  end

  def create
    shelters_importer = ShelterImporter.new(petfinder_api_key)
    shelters = shelters_importer.import(import_params["zipcode"])

    if shelters.count == 0
      msg = "Try these zipcodes: #{shelters_importer.nearby_zipcodes.uniq.join(", ")}"
      render :index
    else
      pets_importer = PetImporter.new(petfinder_api_key)
      pets_importer.import(shelters)

      msg = "#{pets_importer.imported_count} pets in #{shelters.count} shelters were successfully imported."
      redirect_to imports_path, notice: msg
    end

  end

  private
    def import_params
      params[:import]
    end
end
