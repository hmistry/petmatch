class PetsController < ApplicationController
  before_action :set_pet, only: [:show]

  def index
    if animal_params.empty?
      @pets = Pet.all.paginate(page: page_params[:page], per_page: 12)
    else
      @pets = Animal.find_by(type: animal_params["animal"].capitalize).pets.paginate(page: page_params[:page], per_page: 12)
    end
  end

  def show
  end

  private
  def set_pet
    @pet = Pet.find(params[:id])
  end

  def page_params
    params.permit(:page)
  end

  def animal_params
    params.permit(:animal)
  end
end
