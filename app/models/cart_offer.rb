class CartOffer < ApplicationRecord
  belongs_to :cart
  belongs_to :offer
end
