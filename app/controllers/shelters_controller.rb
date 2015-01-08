class SheltersController < ApplicationController
  before_action :set_shelter, only: [:show]

  def index
    @shelters = Shelter.all.paginate(page: page_params[:page], per_page: 10)
  end

  def show
  end

  private
    def set_shelter
      @shelter = Shelter.find(params[:id])
    end

    def page_params
      params.permit(:page)
    end
end
