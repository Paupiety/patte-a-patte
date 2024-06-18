class PetsController < ApplicationController
  before_action :find_pet, only: [:edit, :update, :destroy]

  def new
    @pet = Pet.new
  end

  def create
    @pet = current_user.pets.build(pet_params)
    if @pet.save
      redirect_to user_path(current_user), notice: 'Animal ajouté avec succès.'
    else
      render :new
    end
  end

  def update
    if @pet.update(pet_params)
      redirect_to user_path(current_user), notice: 'Informations de l\'animal mises à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path, notice: 'Pet was successfully deleted.'
  end
end
