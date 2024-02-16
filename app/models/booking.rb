class Booking < ApplicationRecord
  belongs_to :masterpiece
  belongs_to :user
  has_many :reviews

  validates :start_at, presence: true
  validates :end_at, presence: true
end
