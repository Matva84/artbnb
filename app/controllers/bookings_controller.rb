class BookingsController < ApplicationController

  def index
    @user = current_user
    @users = User.all
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

  def new
    @masterpiece = Masterpiece.find(params[:masterpiece_id])
    @booking = Booking.new
  end

  def create
    @user = current_user
    @masterpiece = Masterpiece.find(params[:masterpiece_id])
    @start_date = params[:booking]["start_at"].to_date
    @end_date = params[:booking]["end_at"].to_date

    amount = (@end_date - @start_date) * @masterpiece.price

    @booking = Booking.new(user_id: @user.id, masterpiece_id: @masterpiece.id, start_at: @start_date, end_at: @end_date, total_amount: amount)
    if @masterpiece.available?(@start_date, @end_date) && @booking.save
      redirect_to bookings_path, notice: "La réservation a été effectuée. Total à payer : #{amount}€"
    elsif @masterpiece.available?(@start_date, @end_date) == false
      render :new, notice: "Cet oeuvre n'est plus disponibles sur ces dates."
      # prévoir un message d'alerte en JS
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_path, status: :see_other
  end

end
