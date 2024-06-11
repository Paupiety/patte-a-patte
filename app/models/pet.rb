class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :profile_picture

  def self.ransackable_attributes(auth_object = nil)
    %w[first_name age breed sex category_id created_at updated_at]
  end

  # Vous pouvez également spécifier les associations ransackables si nécessaire
  def self.ransackable_associations(auth_object = nil)
    %w[user category]
  end
end
