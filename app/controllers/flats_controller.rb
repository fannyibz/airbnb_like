class FlatsController < ApplicationController
  before_action :find_flat, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    @flats = Flat.all

    # @flats = Flat.tagged_with("soleil", :on => :tags)
    # @flats = Flat.tagged_with(params[:tag])

    # if params[:location].present?
    #   @flats = Flat.tagged_with(params[:location])
    #   raise
    # end

  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      current_user.tag(@flat, with: flat_params[:location_list], on: :tags)
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :description, :address, :price_per_night, :tag_list)
  end
end
