module CartsHelper

  def create_or_retrieve_cart_current_user
    cart = Cart.find_by(user: current_user)
    return cart if cart
    Cart.create(user: current_user)
  end

#prix total sans les frais de services
  def total_price(cart)
    total_price = 0
    cart.offers.each do |offer|
      total_price += offer.price
    end
    total_price
  end

#prix total
  def services_charges(cart)
    total_price(cart) * 0.04
  end
end
