class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:like, :unlike]

  def index
    @offers = Offer.all
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
      redirect_to :edit
      flash[:error] = "Une erreur a été détectée : #{@offer.errors.full_messages.join(",")}"
    end
  end

  def destroy
    @offer.destroy
    redirect_to offers_url
    flash[:success] = "L'offre a été supprimée avec succès."
  end

  def like
    @offer = Offer.find(params[:id])
    current_user.likes.create(offer: @offer) unless current_user.likes.exists?(offer: @offer)
    redirect_to @offer
  end

  def unlike
    @offer = Offer.find(params[:id])
    like = current_user.likes.find_by(offer: @offer)
    like.destroy if like
    redirect_to @offer
  end
end
