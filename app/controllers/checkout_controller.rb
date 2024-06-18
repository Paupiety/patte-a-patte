class CheckoutController < ApplicationController
  def create
    @total = params[:total].to_d
    @cart_id = params[:cart_id]
    @address = params[:address_id]
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: 'eur',
            unit_amount: (@total*100).to_i,
            product_data: {
              name: 'Rails Stripe Checkout',
            },
          },
          quantity: 1
        },
      ],
      metadata: {
        cart_id: @cart_id
      },
      mode: 'payment',
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
      
    redirect_to @session.url, allow_other_host: true
    if @session.url == checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}'
      Order.create(user: current_user, cart_id: @cart_id, address_id: @address)
      Cart.create(user: current_user)
    end
  end
end
