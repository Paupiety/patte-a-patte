module OffersHelper

    def set_offer
      @offer = Offer.find(params[:id])
    end

    def authenticate_offer_owner!
      unless @offer.user_id == current_user.id
        flash[:error] = "Vous n'êtes pas autorisé à modifier cette offre."
        redirect_to offers_path
      end
    end


  def like
    @offer = Offer.find(params[:id])
    current_user.likes.create(offer: @offer) unless current_user.likes.exists?(offer: @offer)
    redirect_to request.referer || @offer
  end

  def unlike
    @offer = Offer.find(params[:id])
    like = current_user.likes.find_by(offer: @offer)
    like.destroy if like
    redirect_to request.referer || @offer
  end

  def vente
    @typeoffer = Typeoffer.find_by(type_offer: "Vente")
    @offers = Offer.where(type_offer_id: @typeoffer.id)
    render :index
  end

  def adoption
    @typeoffer = Typeoffer.find_by(type_offer: "Adoption")
    @offers = Offer.where(type_offer_id: @typeoffer.id)
    render :index
  end

  def service
    @typeoffer = Typeoffer.find_by(type_offer: "Service")
    @offers = Offer.where(type_offer_id: @typeoffer.id)
    render :index
  end

    def offer_params
      params.require(:offer).permit(:title, :description, :price, :price_type, :type_animal, :date_publication, :image, :photo_1, :photo_2, :type_offer_id)
    end
end
