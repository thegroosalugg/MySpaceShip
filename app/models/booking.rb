class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :spaceships

  enum status: [ :pending, :rejected, :accepted ]

  validates :start_date, presence: true
  validates :end_date, presence: true
end
