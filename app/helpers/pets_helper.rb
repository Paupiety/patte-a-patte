module PetsHelper
  def find_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:first_name, :age, :breed, :sex, :category_id, :profile_picture)
  end
end