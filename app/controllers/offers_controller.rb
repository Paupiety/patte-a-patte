class OffersController < ApplicationController
  before_action :find_offer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:like, :unlike]
  before_action :authenticate_offer_owner!, only: [:edit, :update, :destroy]

  def index
    if params[:search].present?
      @offers_search = Offer.where("title ILIKE ? OR description ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @offers_search = Offer.all
    end
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user

    if @offer.save
      redirect_to @offer
      flash[:success] = "L'offre a été créée avec succès."
    else
      redirect_to new_offer_path
      flash[:error] = "Une erreur a été détectée : #{@offer.errors.full_messages.join(",")}"
    end
  end


  def update
    if @offer.update(offer_params)
      redirect_to @offer
      flash[:success] = "L'offre a été modifiée avec succès."
    else
      redirect_to edit_offer_path
      flash[:error] = "Une erreur a été détectée : #{@offer.errors.full_messages.join(",")}"
    end
  end

  def destroy
    if @offer
     @offer.likes.destroy_all
      @offer.destroy
      flash[:success] = "L'offre a été supprimée avec succès."
      redirect_back(fallback_location: offers_path)
    end
  end
end
