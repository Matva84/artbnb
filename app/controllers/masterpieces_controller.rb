class MasterpiecesController < ApplicationController
 # before_action :set_masterpiece, only: [:show, :destroy]

  def index
    @masterpieces = Masterpiece.all
  end

  def show
    @masterpiece = Masterpiece.find(params[:id])
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  def set_masterpiece
    # @masterpiece = Masterpiece.find(params[:id])
  end

  def masterpiece_params
  end
end
