module CheckoutHelper
    def success
        @session = Stripe::Checkout::Session.retrieve(params[:session_id])
        @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
        @cart_id = @session.metadata.cart_id
    
        @user = current_user
        @cart = Cart.find(@cart_id)
        @offer = @cart.offers.first
    
        OrderMailer.order_confirmation(@user, @offer).deliver_now
      end
    
      def cancel
        flash[:error] = "Le paiement a été annulé ou a échoué."
        redirect_to root_path
      end
    
      def send_order_confirmation_email(cart_id)
        @order = Order.find_by(cart_id: cart_id)
        OrderMailer.with(order: @order).order_confirmation.deliver_now
      end
end
