class Spaceship < ApplicationRecord
  belongs_to :user

  has_many :bookings

  validates :name, presence: true, uniqueness: true
  validates :model, presence: true
  validates :description, presence: true
  validates :picture, presence: true
  validates :daily_rate, presence: true
  validates :available, presence: true
end
