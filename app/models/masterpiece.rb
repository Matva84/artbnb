class Masterpiece < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  # j'ai proposé 3 types d'oeuvre : peinture, sculture, photo
  validates :category, presence: true, inclusion: { in: %w(paint sculture photo) }
  validates :address, presence: true
  # active storage :
  has_one_attached :photo
end
