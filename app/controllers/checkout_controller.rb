class CheckoutController < ApplicationController
  def create
    @total = params[:total].to_d
    @cart_id = params[:cart_id]
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
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    @cart_id = @session.metadata.cart_id

    # Récupérer l'utilisateur et l'offre associée au panier
    @user = current_user
    @cart = Cart.find(@cart_id)
    @offer = @cart.offers.first # ou toute autre méthode pour récupérer l'offre associée au panier

    # Appeler la méthode order_confirmation du mailer avec les arguments requis
    OrderMailer.order_confirmation(@user, @offer).deliver_now
  end

  def cancel
    # Vous pouvez gérer ici les cas d'échec ou d'annulation du paiement
    # Par exemple, afficher un message d'erreur à l'utilisateur ou effectuer d'autres actions nécessaires
    flash[:error] = "Le paiement a été annulé ou a échoué."
    redirect_to root_path
  end

  private

  def send_order_confirmation_email(cart_id)
    # Récupérer la commande associée au cart_id
    @order = Order.find_by(cart_id: cart_id)
    # Envoyer l'e-mail de confirmation de commande
    OrderMailer.with(order: @order).order_confirmation.deliver_now
  end
end
