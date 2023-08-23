class Spaceship < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy

  validates :name, presence: true #, uniqueness: true
  validates :model, presence: true
  validates :description, presence: true
  # validates :picture_url, presence: true
  # validates :daily_rate, presence: true
  # validates :available, presence: true
end
