class AddBookingOptionEnabledToOffers < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :booking_option_enabled, :boolean
  end
end
