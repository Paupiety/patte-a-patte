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

    def offer_params
      params.require(:offer).permit(:title, :description, :price, :type_animal, :date_publication, :image, :type_offer_id)
    end
end
