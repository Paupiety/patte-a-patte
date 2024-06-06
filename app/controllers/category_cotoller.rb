class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(offer_params)
    @category.user = admin_user

    if @category.save
      redirect_to @admin
      flash[:success] = "La catégorie a été créée avec succès."
    else
      redirect_to new_category_path
      flash[:error] = "Une erreur a été détectée : #{@category.errors.full_messages.join(",")}"
    end
  end

  def destroy
    @offer.destroy
    redirect_to admins_url
    flash[:success] = "La catégorie a été supprimée avec succès."
  end
end