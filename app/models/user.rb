class User < ApplicationRecord
  after_create :welcome_send
  has_one_attached :profile_picture
  has_one :cart
  has_many :offers, dependent: :destroy
  has_many :comments
  has_many :pets, dependent: :destroy
  has_many :likes
  has_many :liked_offers, through: :likes, source: :offer
  has_many :user_addresses
  has_many :addresses, through: :user_addresses
  accepts_nested_attributes_for :user_addresses
  validates :phone_number, format: { with: /\A\d{10}\z/, message: "doit contenir exactement 10 chiffres" }, allow_blank: true

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "email", "encrypted_password", "first_name", "id", "last_name", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["cart", "orders", "profile_picture_attachment", "profile_picture_blob"]
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
