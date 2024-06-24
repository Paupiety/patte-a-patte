# app/controllers/bookings_controller.rb
class BookingsController < ApplicationController
  before_action :set_offer, only: [:new, :create]
  before_action :set_booking, only: [:approve, :decline]

  def new
    @booking = Booking.new
  end

  def create
    @booking = @offer.bookings.new(booking_params)
    @booking.user = current_user
    @booking.status = :pending

    if @booking.save
      # Implémenter la logique de paiement ici
      redirect_to @offer, notice: 'Réservation créée avec succès. En attente de validation.'
    else
      render :new
    end
  end

  def approve
    @booking.update(status: :confirmed)
    redirect_to bookings_path, notice: 'Réservation confirmée.'
  end

  def decline
    @booking.update(status: :declined)
    redirect_to bookings_path, notice: 'Réservation refusée.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
