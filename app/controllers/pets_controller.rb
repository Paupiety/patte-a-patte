class PetsController < ApplicationController
  before_action :set_pet, only: [:edit, :update, :destroy]
  before_action :set_user

  def new
    @pet = Pet.new
  end

  def create
    @pet = @user.pets.build(pet_params)
    if @pet.save
      redirect_to user_path(@user), notice: 'Animal ajouté avec succès.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to user_path(@user), notice: 'Informations de l\'animal mises à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to user_path(@user), notice: 'Animal supprimé avec succès.'
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def pet_params
    params.require(:pet).permit(:first_name, :age, :breed, :sex, :category_id, :profile_picture)
  end
end
