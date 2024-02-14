class Booking < ApplicationRecord
  belongs_to :masterpiece
  belongs_to :user
end
