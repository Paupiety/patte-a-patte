class CategoriesController < ApplicationController
  before_action :authenticate_admin_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_category, only: [:edit, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to new_category_path
      flash[:success] = "La catégorie a été créée avec succès."
    else
      redirect_to new_category_path
      flash[:error] = "Une erreur a été détectée : #{@category.errors.full_messages.join(",")}"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    @category.destroy
    redirect_to admins_url
    flash[:success] = "La catégorie a été supprimée avec succès."
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:type_animal)
  end

  def authenticate_admin_user!
    unless current_user.admin?
      redirect_to root_path
      flash[:error] = "Accès refusé"
    end
  end
end
