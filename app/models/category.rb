class Category < ApplicationRecord
  has_many :offer

  validates :type_animal, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[type_animal offer_id created_at updated_at]
  end
end