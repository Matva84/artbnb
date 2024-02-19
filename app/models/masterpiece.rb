class Masterpiece < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  # j'ai proposé 3 types d'oeuvre : peinture, sculture, photo
  validates :category, presence: true, inclusion: { in: %w(paint sculpture photo) }
  validates :address, presence: true
  # active storage :
  has_one_attached :photo

  include PgSearch::Model
  # multisearchable against: [:title, :description, :category, :address]
  pg_search_scope :search_by_title_description_and_address,
    against: [ :title, :description, :category, :address ], using: { tsearch: { prefix: true } }
end
