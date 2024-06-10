class Typeoffer < ApplicationRecord
  has_many :offers
  validates :type_offer, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[type_offer created_at updated_at]
  end
end
