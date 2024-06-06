class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :title, presence: true
  validates :content, presence: true
end
