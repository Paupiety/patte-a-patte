class TypeoffersController < ApplicationController
  before_action :authenticate_admin_user!, only: [:new, :create, :edit, :destroy]
  before_action :find_type_offer, only: [:edit, :destroy]

  def new
    @type_offer = Typeoffer.new
  end

  def create
    @type_offer = Typeoffer.new(type_offer_params)

    if @type_offer.save
      redirect_to new_typeoffer_path
      flash[:success] = "La type d'offre a été créé avec succès."
    else
      redirect_to new_typeoffer_path
      flash[:error] = "Une erreur a été détectée : #{@type_offer.errors.full_messages.join(",")}"
    end
  end

  def destroy
    @type_offer.destroy
    redirect_to admins_url
    flash[:success] = "La catégorie a été supprimée avec succès."
  end
end
