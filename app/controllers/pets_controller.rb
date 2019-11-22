class PetsController < ApplicationController

  def index
    if(params[:id])
      @pets = Shelter.find(params[:id]).adoptable_pets
    else
      @pets = Pet.all
    end
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    shelter = Shelter.find(params[:id])
    pet = shelter.pets.create!(pet_params)
    redirect_to "/shelters/#{shelter.id}/pets"
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)

    pet.save

    redirect_to "/pets/#{pet.id}"
    end


  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end

private
  def pet_params
    params[:status] = "adoptable"
    params.permit(:image,
                  :name,
                  :desc,
                  :age,
                  :sex,
                  :status)
  end

end
