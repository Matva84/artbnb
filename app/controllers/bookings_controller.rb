class BookingsController < ApplicationController

  def index
    @user = current_user
    @masterpieces = Masterpiece.all
    bookings = Booking.all
    @bookings = []
    # je prends que les bookings qui correspondent à mon user, et je passe
    # uniquement cette liste à la vue
    bookings.each do |booking|
      if booking.user_id == @user.id
        @bookings << booking
      end
    end
  end
end
