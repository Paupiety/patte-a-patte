class TypeofferController < ApplicationController
before_action :set_type, only: [:edit, :destroy]

  def new
    @type_offer = Type.new
  end

  def create
    @type_offer = Type.new(offer_params)
    @type_offer.user = admin_user

    if @type_offer.save
      redirect_to @admin
      flash[:success] = "La type d'offre a été créé avec succès."
    else
      redirect_to new_typeoffer_path
      flash[:error] = "Une erreur a été détectée : #{@type.errors.full_messages.join(",")}"
    end
  end

  def destroy
    @type_offer.destroy
    redirect_to admins_url
    flash[:success] = "La catégorie a été supprimée avec succès."
  end
end
