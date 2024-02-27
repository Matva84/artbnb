class BookingsController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    @masterpieces = Masterpiece.all
    @bookings_all = Booking.all
    @bookings = []
    # je prends que les bookings qui correspondent à mon user, et je passe
    # uniquement cette liste à la vue
    @bookings_all.each do |booking|
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

    amount = (@end_date - @start_date + 1) * @masterpiece.price

    if @masterpiece.available?(@start_date, @end_date)
      @booking = Booking.new(user_id: @user.id, masterpiece_id: @masterpiece.id, start_at: @start_date, end_at: @end_date, total_amount: amount)
      if @booking.save
        redirect_to bookings_path, alert: "Artwork successfully booked. Total amount : #{amount}€"
      else
        render :new
      end
    else
      redirect_to booking_path(@masterpiece), alert: "Not available. Dates already booked"
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @user = current_user
    @masterpiece = Masterpiece.find(params[:masterpiece_id])
    @start_date = params[:booking]["start_at"].to_date
    @end_date = params[:booking]["end_at"].to_date

    amount = (@end_date - @start_date + 1) * @masterpiece.price

    @booking.update(user_id: @user.id, masterpiece_id: @masterpiece.id, start_at: @start_date, end_at: @end_date, total_amount: amount)
    redirect_to bookings_path, alert: "Artwork successfully updated. Amount : #{amount}€"
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

end
