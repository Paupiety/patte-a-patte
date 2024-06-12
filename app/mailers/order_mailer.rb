class OrderMailer < ApplicationMailer
  default from: 'https://patte-a-patte.fly.dev/'

  def order_confirmation(user, offer)
    @user = user
    @offer = offer
    mail(to: @user.email, subject: "Confirmation de commande sur Patte à Patte")
  end
end
