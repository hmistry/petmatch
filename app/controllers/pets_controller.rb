class PetsController < ApplicationController
  before_action :set_pet, only: [:show]

  def index
    @pets = Pet.all.paginate(page: page_params[:page], per_page: 12)
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
end
