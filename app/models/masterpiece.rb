class Masterpiece < ApplicationRecord
  AUTHORIZED_CATEGORIES = ["Paint", "Sculpture", "Photo"]
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  # j'ai proposé 3 types d'oeuvre : peinture, sculture, photo
  validates :category, presence: true, inclusion: { in: AUTHORIZED_CATEGORIES }
  validates :address, presence: true
  # active storage :
  has_one_attached :photo

  include PgSearch::Model
  # multisearchable against: [:title, :description, :category, :address]
  pg_search_scope :search_by_title_description_and_address,
    against: [ :title, :description, :category, :address ], using: { tsearch: { prefix: true } }

  def available?(start_date, end_date)
    bookings.each do |booking|
      return false if (booking.start_at..booking.end_at).overlaps?(start_date.to_date..end_date.to_date)
    end
    return true
  end
end
