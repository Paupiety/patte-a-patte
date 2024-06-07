class Typeoffer < ApplicationRecord
  has_many :offers
  validates :type_offer, presence: true
end
