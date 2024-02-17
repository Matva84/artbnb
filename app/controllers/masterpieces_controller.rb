class MasterpiecesController < ApplicationController

  def index
    @masterpieces = Masterpiece.all
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
    params.require(:masterpiece).permit(:title, :description, :price, :address, :category, :photo)
  end
end
