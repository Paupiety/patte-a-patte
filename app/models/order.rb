class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  belongs_to :address

  def self.ransackable_associations(auth_object = nil)
    ["address", "cart", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["address_id", "cart_id", "created_at", "id", "id_value", "updated_at", "user_id"]
  end
end
