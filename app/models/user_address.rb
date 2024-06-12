class UserAddress < ApplicationRecord
  belongs_to :user
  belongs_to :address
  accepts_nested_attributes_for :address, allow_destroy: true
end
