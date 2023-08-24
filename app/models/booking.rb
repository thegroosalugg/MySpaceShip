class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :spaceship

  enum status: [ :pending, :rejected, :accepted ]

  validates :start_date, presence: true
  validates :end_date, presence: true
  # validate :end_date_after_start_date

  # def end_date_after_start_date
  #   if end_date < start_date
  #     errors.add(:end_date, "cannot be before the start date")
  #   end
  # end
end
