class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_offers
  has_many :offers, through: :cart_offers
end
