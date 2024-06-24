class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :start_time, :end_time, :status, presence: true

  enum status: { pending: 0, confirmed: 1, declined: 2 }
end
