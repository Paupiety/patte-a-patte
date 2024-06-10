class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :title, presence: true
  validates :content, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["title", "content", "created_at", "updated_at", "user_id", "offer_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user offer]
  end
end
