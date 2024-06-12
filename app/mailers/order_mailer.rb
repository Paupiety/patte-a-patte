class OrderMailer < ApplicationMailer
  default from: ENV['MAILJET.DEFAULT_FROM']

  def order_confirmation(user, offer)
    @user = user
    @offer = offer
    mail(to: @user.email, subject: "Confirmation de commande sur Patte à Patte")
  end
end
