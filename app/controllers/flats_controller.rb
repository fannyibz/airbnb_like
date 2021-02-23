class FlatsController < ApplicationController
  before_action :find_flat, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index

    # @flats = Flat.tagged_with(params[:location])
    @flats = Flat.tagged_with("soleil", :on => :tags)
    # raise
    # @flats = Flat.all

    # if params[:location].present?
    #   @flats = Flat.tagged_with(params[:location])
    #   raise
    # end
    # @flats = FetchTaggerFlatForUserService.new(current_user).perform
   # Flat.tagged_with("soleil", :on => :tas)
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
      current_user.tag(@flat, with: flat_params[:location_list], on: :locations)
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :description, :address, :price_per_night, :location_list)
  end
end
