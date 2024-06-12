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

    # Création de l'Attendance ici après un paiement réussi
    # Vous devez adapter cette partie en fonction de votre modèle Attendance
    #Attendance.create(event_id: @event_id, user_id: current_user.id)
  end

  def cancel
    # Vous pouvez gérer ici les cas d'échec ou d'annulation du paiement
    # Par exemple, afficher un message d'erreur à l'utilisateur ou effectuer d'autres actions nécessaires
    flash[:error] = "Le paiement a été annulé ou a échoué."
    redirect_to root_path
  end
end
