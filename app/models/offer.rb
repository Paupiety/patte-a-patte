class Offer < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :liking_users, through: :likes, source: :user

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :type_animal, presence: true
  validates :type_offer, presence: true
  belongs_to :type_offer

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "date_publication", "description", "id", "price", "title", "type_animal", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end
end
