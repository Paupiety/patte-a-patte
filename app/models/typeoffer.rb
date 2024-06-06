class Typeoffer < ApplicationRecord
  has_many :offer

  validates :type_offer, presence: true
end
