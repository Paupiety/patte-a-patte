module OffersHelper
  
    def set_offer
      @offer = Offer.find(params[:id])
    end

    def offer_params
      params.require(:offer).permit(:title, :description, :price, :type_animal, :date_publication, :image, :type_offer_id)
    end
end
