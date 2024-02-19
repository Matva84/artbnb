class MasterpiecesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:search].present?
      @masterpieces = Masterpiece.search_by_title_description_and_address(params[:search][:search])
    else
      @masterpieces = Masterpiece.all
    end
  end

  def show
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
  end

  private

  def set_masterpiece
  end

  def masterpiece_params
    params.require(:masterpiece).permit(:id, :title, :description, :price, :address, :category, :photo)
  end
end
