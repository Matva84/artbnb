class MasterpiecesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:search].present?
      @masterpieces = Masterpiece.search_by_title_description_and_address(params[:search][:search])
    else
      @masterpieces = Masterpiece.all
    end
    if params[:max_price].present?
      puts @masterpieces
      @masterpieces = @masterpieces.where("price <= ?", params[:search][:max_price])
    end
    if params[:category].present?
      @masterpieces = @masterpieces.where(category: params[:search][:category])
    end
    if params[:start_at].present? && params[:search][:end_at].present?
      puts "TODO"
    end
  end

  def show
    @users = User.all
    @masterpiece = Masterpiece.find(params[:id])
  end

  def new
    @masterpiece = Masterpiece.new
  end

  def create
    @masterpiece = Masterpiece.new(masterpiece_params)
    if @masterpiece.save
      redirect_to masterpieces_path, notice: "La nouvelle œuvre a été ajoutée avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @masterpiece = Masterpiece.find(params[:id])
    @masterpiece.destroy
    redirect_to masterpieces_collection_path, status: :see_other
  end

  def collection
    @user = current_user
    masterpieces = Masterpiece.all
    @masterpieces = []
    masterpieces.each do |masterpiece|
      if masterpiece.user_id == @user.id
        @masterpieces << masterpiece
      end
    end
  end

  private

  def set_masterpiece
  end

  def masterpiece_params
    params.require(:masterpiece).permit(:id, :title, :description, :price, :address, :category, :photo)
  end
end
