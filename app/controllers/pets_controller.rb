class PetsController < ApplicationController
  before_action :set_pet, only: [:show]

  def index
    if animal_params.empty?
      @pets = Pet.includes(:shelter).all.paginate(page: page_params[:page], per_page: 12)
    else
      @pets = Pet.includes(:animal, :shelter).where(animal: Animal.const_get(animal_params["animal"].upcase)).paginate(page: page_params[:page], per_page: 12)
    end
  end

  def show
  end

  private
  def set_pet
    @pet = Pet.includes(:animal, :shelter, :options, :breeds).find(params[:id])
  end

  def page_params
    params.permit(:page)
  end

  def animal_params
    params.permit(:animal)
  end
end
