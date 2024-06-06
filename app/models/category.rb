class Category < ApplicationRecord
  has_many :offer

  validates :type_animal, presence: true
end