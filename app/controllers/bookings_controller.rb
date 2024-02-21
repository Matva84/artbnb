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
    @start_date = Date.new(params[:booking]["start_at(1i)"].to_i,
                          params[:booking]["start_at(2i)"].to_i,
                          params[:booking]["start_at(3i)"].to_i)

    @end_date = Date.new(params[:booking]["end_at(1i)"].to_i,
                        params[:booking]["end_at(2i)"].to_i,
                        params[:booking]["end_at(3i)"].to_i)
    amount = (@end_date - @start_date) * @masterpiece.price
    @booking = Booking.new(user_id: @user.id, masterpiece_id: @masterpiece.id, start_at: @start_date, end_at: @end_date, total_amount: amount)
    if @masterpiece.available?(@start_date, @end_date) && @booking.save
      redirect_to bookings_path, notice: "La réservation a été effectuée. Total à payer : #{amount}€"
    elsif @masterpiece.available?(@start_date, @end_date) == false
      render :new, notice: "La réservation a été effectuée."
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
