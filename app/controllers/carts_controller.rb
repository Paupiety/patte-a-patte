class CartsController < ApplicationController
    def show
        @cart = create_or_retrieve_cart_current_user
        @total_price = total_price(@cart)
      end
end
