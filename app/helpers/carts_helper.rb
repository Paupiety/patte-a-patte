module CartsHelper
    def create_or_retrieve_cart_current_user
        cart = Cart.find_by(user: current_user)
        return cart if cart
        Cart.create(user: current_user)
      end

#to have total_price of the cart withour services charges
      def total_price(cart)
        total_price = 0
        cart.offers.each do |offer|
          total_price += offer.price
        end
        total_price
      end


      def services_charges(cart)
        total_price(cart) * 0.04
      end
end
