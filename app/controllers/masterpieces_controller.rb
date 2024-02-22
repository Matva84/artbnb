class MasterpiecesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @masterpieces = Masterpiece.all
    if params[:search].present?
      key_word = params[:search][:search]
      if key_word != ""
        @masterpieces = Masterpiece.search_by_title_description_and_address(params[:search][:search])
      end
      if params[:max_price].present?
        @masterpieces = @masterpieces.where("price <= ?", params[:max_price])
      end
      if params[:category].present?
        @masterpieces = @masterpieces.where(category: params[:category])
      end
      if params[:search][:start_at].present? && params[:search][:end_at].present?
        @masterpieces = @masterpieces.select do |masterpiece|
          masterpiece.available?(params[:search][:start_at], params[:search][:end_at])
        end
      end
    end
  end

  def show
    @users = User.all
    @masterpiece = Masterpiece.find(params[:id])
  end

  def create
    @user = current_user
    @masterpiece = Masterpiece.new(masterpiece_params)
    @masterpiece.user_id = @user.id
    if @masterpiece.save
      redirect_to masterpieces_collection_path, notice: "La nouvelle œuvre a été ajoutée avec succès."
    else
      render :collection, status: :unprocessable_entity
    end
  end

  def destroy
    @masterpiece = Masterpiece.find(params[:id])
    @masterpiece.destroy
    redirect_to masterpieces_collection_path, status: :see_other
  end

  def collection
    @users = User.all
    @user = current_user
    masterpieces = Masterpiece.all
    @masterpieces = []
    masterpieces.each do |masterpiece|
      if masterpiece.user_id == @user.id
        @masterpieces << masterpiece
      end
    end
    @bookings = Booking.all
    @new_masterpiece = Masterpiece.new
  end

  private

  def set_masterpiece
  end

  def masterpiece_params
    params.require(:masterpiece).permit(:title, :description, :price, :address, :category, :photo)
  end
end
