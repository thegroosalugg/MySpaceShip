class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :spaceships

  enum status: [ :pending, :rejected, :accepted ]
end
