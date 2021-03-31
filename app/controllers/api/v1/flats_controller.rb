class Api::V1::FlatsController < Api::V1::BaseController
  before_action :set_flat, only: [ :show ]

  def index
    @flats = policy_scope(Flat)
  end

  def show
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
    authorize @flat
  end
end
