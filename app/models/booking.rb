class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :spaceships

  validates :start_date, presence: true
  validates :end_date, presence: true
  
  enum status: [ :pending, :rejected, :accepted ]
end
