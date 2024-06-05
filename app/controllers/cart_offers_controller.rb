class CartOffersController < ApplicationController
    def create
        id = params[:offer_id]
        @cart = Cart.find_by(user: current_user)
        @offer = Offer.find(id)
        @cart_offer = CartOffer.new(cart: @cart, offer: @offer)
        return unless @cart_offer.save
    
        redirect_back(fallback_location: root_path)
        flash[:success] = "L'article a été ajouté au panier"
      end
    
      def destroy
        id = params[:offer_id]
        @cart = Cart.find_by(user: current_user)
        @offer = Item.find(id)
        @cart_offer = CartItem.find_by(cart: @cart, item: @offer)
        @cart_offer.destroy
        redirect_back(fallback_location: root_path)
        flash[:success] = "L'article a  été supprimé de votre panier"
      end
end
