class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def new
  end

  def create
    shelter = Shelter.new({
      name: params[:shelter][:name],
      address: params[:shelter][:address],
      city: params[:shelter][:city],
      state: params[:shelter][:state],
      zip: params[:shelter][:zip]
      })
      
    shelter.save

    redirect_to '/shelters'
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  # private
  # def shelter_params
  #   params.require(:shelter).permit(:name, :address, :city, :state, :zip)
  # end
end
